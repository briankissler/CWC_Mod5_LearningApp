//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Brian Kissler on 8/1/21.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView().environmentObject(ContentModel())
        }
    }
}
