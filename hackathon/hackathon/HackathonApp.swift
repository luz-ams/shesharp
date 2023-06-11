//
//  hackathonApp.swift
//  hackathon
//
//  Created by Luz Racca on 10/06/2023.
//

import SwiftUI

@main
struct hackathonApp: App {
    @UIApplicationDelegateAdaptor var appDelegate: AppDelegate
    
    var body: some Scene {
        WindowGroup {
            AppView(viewModel: AppViewModel())
        }
    }
}
