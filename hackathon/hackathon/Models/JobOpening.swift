//
//  JobOpening.swift
//  hackathon
//
//  Created by Luz Racca on 10/06/2023.
//

import Foundation

struct JobOpeningData: Codable {
    let data: [JobOpening]
}

struct JobOpening: Identifiable, Codable, Hashable {
    var id: String {
        "\(jobName)"
    }
    
    let jobName: String
    let tagsMatched: [String] // I'll use this for the user's skills
    
    enum CodingKeys: String, CodingKey {
        case jobName = "job_name"
        case tagsMatched = "tags_matched"
    }
}
