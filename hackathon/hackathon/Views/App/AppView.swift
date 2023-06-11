//
//  HomeView.swift
//  hackathon
//
//  Created by Luz on 10/06/2023.
//

import SwiftUI

struct AppView: View {
    @ObservedObject var viewModel: AppViewModel
    
    let gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 10) {
                kittenName
                phoneCallView
                Spacer(minLength: 5)
                jobPosition
                candidateInfo
            }
            .accentColor(.black)
            .navigationBarTitle("Hire Meow", displayMode: .inline)
            .navigationBarItems(
                trailing: Button(action: {
                    viewModel.randomizeCurriculum()
                }) {
                    Text("Next")
                        .padding(.trailing, -16)
                }
            )
            .accentColor(.black)
            .font(.custom("Helvetica", size: 18))
        }
        .padding()
        .onAppear(perform: {
            viewModel.onAppear()
        })
        .ignoresSafeArea(.all, edges: .bottom)
    }
    
    @ViewBuilder
    var candidateInfo: some View {
        ZStack {
            // Outer Border
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1)
            ScrollView {
                VStack(spacing: 15) {
                    matchingSoftwareSkills
                    matchingLanguageSkills
                    matchingVacancies
                }
                .padding()
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
    
    @ViewBuilder
    var phoneCallView: some View {
        ZStack(alignment: .bottom) {
            kittenCallingImage
            callOverlay
        }
    }
    
    @ViewBuilder
    var jobPosition: some View {
        if let job = viewModel.jobPosition {
            Text(job)
                .font(.custom("Helvetica-Bold", size: 18))
                .padding(5)
        }
    }
    
    @ViewBuilder
    var kittenCallingImage: some View{
        if let cv = viewModel.curriculum {
            GeometryReader { geometry in
                ZStack(alignment: .bottom) {
                    Rectangle()
                        .foregroundColor(.black)
                        .frame(width: geometry.size.width)
                    Image(cv.imageURL, bundle: .main)
                        .renderingMode(.original)
                        .resizable()
                        .frame(height: 250)
                        .aspectRatio(contentMode: .fit)
                        .background(.red)
                }
            }
            .cornerRadius(8)
        }
    }
    
    @ViewBuilder
    var callOverlay: some View {
        VStack {
            Spacer()
            phoneStuff
        }
        .padding([.vertical], 20)
    }
    
    @ViewBuilder
    var kittenName: some View {
        if let cv = viewModel.curriculum {
            Text(cv.nickname)
                .font(.custom("Helvetica-Bold", size: 45))
        }
    }
    
    @ViewBuilder
    var phoneStuff: some View {
        HStack(spacing: 30) {
            Image(systemName: "video.fill")
                .font(.largeTitle)
                .foregroundColor(.green)
            Image(systemName: "mic.fill")
                .font(.largeTitle)
                .foregroundColor(.green)
            Image(systemName: "phone.fill")
                .font(.largeTitle)
                .foregroundColor(.red)
        }
    }
    
    @ViewBuilder
    var curriculumHeader: some View {
        if let cv = viewModel.curriculum {
            Text(cv.nickname)
                .background(.white)
                .cornerRadius(8)
        }
    }
    
    @ViewBuilder
    var matchingVacancies: some View {
        if let openings = viewModel.openings {
            VStack {
                matching(title: "Other vacancies", value: "\(openings.count)")
                VStack(spacing: 10) {
                    ForEach(Array(openings.enumerated()), id: \.offset) { index, opening in
                        Button(action: {
                            viewModel.selectedJobPosition(opening.jobName)
                        }) {
                            HStack {
                                Text(opening.jobName)
                                Spacer()
                                Image(systemName: "arrow.forward.circle")
                            }
                            .padding()
                            .frame(height: 50)
                            .background(viewModel.colorForElement(index: index, totalElements: openings.count))
                            .cornerRadius(8)
                        }
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    var matchingSoftwareSkills: some View {
        VStack {
            matching(title: "Matching software skills")
            LazyVGrid(columns: gridItemLayout, spacing: 16) {
                ForEach(viewModel.matchingSoftwareSkills, id: \.self) { stringa in
                    Text(stringa)
                        .frame(maxHeight: 10)
                        .padding()
                        .background(viewModel.randomColorForTag())
                        .cornerRadius(8)
                        .foregroundColor(.white)
                }
            }
        }
    }
    
    @ViewBuilder
    var matchingLanguageSkills: some View {
        VStack {
            matching(title: "Matching language skills")
            LazyVGrid(columns: gridItemLayout, spacing: 16) {
                ForEach(viewModel.matchingLanguageSkills, id: \.self) { title in
                    Text(title)
                        .frame(maxHeight: 10)
                        .padding()
                        .background(viewModel.randomColorForTag())
                        .cornerRadius(8)
                        .foregroundColor(.white)
                }
            }
        }
    }
    
    @ViewBuilder
    func matching(title: String, value: String? = nil) -> some View {
        HStack {
            Text(title)
            Spacer()
            if let value = value {
                Text(value)
            }
        }
        .font(.custom("Helvetica-Bold", size: 20))
        .padding(5)
    }
}

#Preview {
    AppView(viewModel: AppViewModel())
}
