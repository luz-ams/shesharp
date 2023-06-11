//
//  Curriculum.swift
//  hackathon
//
//  Created by Luz Racca on 10/06/2023.
//

import Foundation
import SwiftUI

struct Curriculum {
    let name: String
    let surname: String
    let nickname: String
    let imageURL: String
    let skills: [Skill]
}

struct Skill {
    let tag: String
    let strength: CapabilityStrenght
    let experienceInYears: Int
}

enum CapabilityStrenght: Int {
    case low = 0
    case medium = 1
    case high = 3
}
