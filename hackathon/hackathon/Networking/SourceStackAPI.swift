//
//  SourceStackAPI.swift
//  hackathon
//
//  Created by Luz on 10/06/2023.
//

import Foundation

public class SourceStackAPI {
    private let remoteApiManager: RemoteApiManaging
    
    init() {
        self.remoteApiManager = RemoteAPIManager()
    }
    
    func fetchJobOpeningsRemotely() -> [JobOpening]? {
        //TODO: make async
        guard let url = URL(string: "https://sourcestack-api.com/jobs?name=ios&exact=False&language=en") else {
            preconditionFailure("url not valid")
        }
        
        var resultArray = [JobOpening]()
        remoteApiManager.makeRESTCall(url: url) { result in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                if let decodedJobListing = try? decoder.decode(JobOpeningData.self, from: data) {
                    for job in decodedJobListing.data {
                        resultArray.append(job)
                    }
                }
            case .failure(let error):
                print("Error:", error)
            }
        }
        
        return nil
    }
    
    func fetchJobOpeningsLocally() -> [JobOpening]? {
        guard let url = Bundle.main.url(forResource: "SourceStackLocal", withExtension: "json") else {
            preconditionFailure("url not valid")
        }
        
        var resultArray = [JobOpening]()
        do {
            let jsonData = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            if let decodedJobListing = try? decoder.decode(JobOpeningData.self, from: jsonData) {
                for job in decodedJobListing.data {
                    resultArray.append(job)
                }
            }
        } catch {
            print("Error:", error)
        }
        
        return resultArray
    }
}
