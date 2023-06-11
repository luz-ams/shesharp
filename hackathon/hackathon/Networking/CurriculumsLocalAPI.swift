//
//  CurriculumsLocalAPI.swift
//  hackathon
//
//  Created by Luz on 10/06/2023.
//

import Foundation
import SwiftUI

public class CurriculumsLocalAPI {
    func fetchCurriculums() -> [Curriculum] {
        return [.luz, .stefan, .mary, .oscar]
    }
}

// Mocks
extension Curriculum {
    static let luz: Curriculum = {
        Curriculum(
            name: "Luz",
            surname: "Doe",
            nickname: "Bailey",
            imageURL: "kitten",
            skills: [
                Skill(
                    tag: "swift",
                    strength: .high,
                    experienceInYears: 5
                ),
                Skill(
                    tag: "java",
                    strength: .low,
                    experienceInYears: 3
                ),
                Skill(
                    tag: "english",
                    strength: .high,
                    experienceInYears: 20
                ),
                Skill(
                    tag: "react",
                    strength: .low,
                    experienceInYears: 1
                )
            ]
        )
    }()
    
    static let mary: Curriculum = {
        Curriculum(
            name: "Mary",
            surname: "Osorio",
            nickname: "Riley",
            imageURL: "kitten2",
            skills: [
                Skill(
                    tag: "swift",
                    strength: .high,
                    experienceInYears: 5
                ),
                Skill(
                    tag: "java",
                    strength: .low,
                    experienceInYears: 3
                ),
                Skill(
                    tag: "english",
                    strength: .high,
                    experienceInYears: 20
                ),
                Skill(
                    tag: "react",
                    strength: .low,
                    experienceInYears: 1
                )
            ]
        )
    }()
    
    static let stefan: Curriculum = {
        Curriculum(
            name: "Stefan",
            surname: "Richter",
            nickname: "Harper",
            imageURL: "kitten3",
            skills: [
                Skill(
                    tag: "swift",
                    strength: .high,
                    experienceInYears: 5
                ),
                Skill(
                    tag: "java",
                    strength: .low,
                    experienceInYears: 3
                ),
                Skill(
                    tag: "english",
                    strength: .high,
                    experienceInYears: 20
                ),
                Skill(
                    tag: "react",
                    strength: .low,
                    experienceInYears: 1
                )
            ]
        )
    }()
    
    static let oscar: Curriculum = {
        Curriculum(
            name: "Stefan",
            surname: "Richter",
            nickname: "Scout",
            imageURL: "kitten4",
            skills: [
                Skill(
                    tag: "swift",
                    strength: .high,
                    experienceInYears: 5
                ),
                Skill(
                    tag: "java",
                    strength: .low,
                    experienceInYears: 3
                ),
                Skill(
                    tag: "english",
                    strength: .high,
                    experienceInYears: 20
                ),
                Skill(
                    tag: "react",
                    strength: .low,
                    experienceInYears: 1
                )
            ]
        )
    }()
}
