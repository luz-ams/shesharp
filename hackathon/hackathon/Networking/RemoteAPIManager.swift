//
//  RemoteAPIManager.swift
//  hackathon
//
//  Created by Luz Racca on 10/06/2023.
//

import Foundation

protocol RemoteApiManaging {
    func makeRESTCall(url: URL, completion: @escaping (Result<Data, Error>) -> Void)
}

class RemoteAPIManager: RemoteApiManaging {
    enum Constants {
        static let apiKeyHeader = "X-API-KEY"
        static let apiKey = "qUGz0iShhT7rSOiqm3wLMaC2ucVzkOxF979Y0Bh2"
    }
    
    func makeRESTCall(url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        var request = URLRequest(url: url)
        request.addValue(Constants.apiKey, forHTTPHeaderField: Constants.apiKeyHeader)
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let data = data {
                completion(.success(data))
//                _ = data.logAPI()
            } else {
                let error = NSError(domain: "com.example.app", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data received"])
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}

extension Data {
    public func logAPI() -> Data {
        // Disable print rule here. Only compiled for DEBUG. Won't reach prod.
        // swiftlint:disable avoid_print
        if let json = try? JSONSerialization.jsonObject(with: self),
           let data = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted),
           let text = String(data: data, encoding: .utf8) {
            Swift.print("🔵 RESPONSE - JSON -> \(text)")
        } else {
            let text = String(data: self, encoding: .utf8) ?? "not a valid .utf8 String"
            Swift.print("🔵 RESPONSE - NOT VALID JSON -> \"\(text)\"")
        }
        // swiftlint:enable avoid_print
        return self
    }
}
