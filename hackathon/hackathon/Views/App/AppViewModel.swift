//
//  HomeViewModel.swift
//  hackathon
//
//  Created by Luz on 10/06/2023.
//

import Foundation
import SwiftUI

class AppViewModel: ObservableObject {
    @Published var curriculum: Curriculum?
    @Published var openings: [JobOpening]?
    @Published var jobPosition: String?
    @Published var matchingSoftwareSkills: [String] = ["Java", "Python", "C#", "React"]
    @Published var matchingLanguageSkills: [String] = ["English", "Spanish", "German", "Italian"]
    
    private let remoteAPI: SourceStackAPI
    private let localAPI: CurriculumsLocalAPI
    
    init() {
        self.remoteAPI = SourceStackAPI()
        self.localAPI = CurriculumsLocalAPI()
    }
    
    func onAppear() {
        curriculum = fetchCurriculums()
        openings = fetchOpenings()
        randomizeCurriculum()
    }
    
    func randomizeCurriculum() {
        curriculum = fetchCurriculums()
    }
    
    func selectedJobPosition(_ name: String) {
        jobPosition = name
    }
    
    func fetchCurriculums() -> Curriculum? {
        localAPI.fetchCurriculums().randomElement()
        //Calculate matches
    }
    
    func fetchOpenings() -> [JobOpening]? {
        let result = fetchOpeningsLocally()
        
        guard let opening = result?.first else { return nil }
        
        selectedJobPosition(opening.jobName)
        
        return result
    }
    
    func fetchOpeningsLocally() -> [JobOpening]? {
        remoteAPI.fetchJobOpeningsLocally()
    }
    
    func fetchOpeningsRemotely() -> [JobOpening]?{
        remoteAPI.fetchJobOpeningsRemotely()
    }
    
    // Color should match from most matching to lets matching job opening
    // - Random: not based in real data -
    func colorForElement(index: Int, totalElements: Int) -> Color {
        let partSize = totalElements / 3
        if index < partSize {
            return .green
        } else if index < 2 * partSize {
            return .orange
        } else {
            return .yellow
        }
    }
    
    func randomColorForTag() -> Color {
        let colors: [Color] = [.green, .gray, .orange, .gray]
        
        let randomIndex = Int.random(in: 0..<colors.count)
        return colors[randomIndex]
    }
}
