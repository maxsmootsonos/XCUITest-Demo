//
//  ExplorationApp.swift
//  Exploration
//
//  Created by Max Smoot on 1/23/23.
//

import SwiftUI

@main
struct ExplorationApp: App {
    @StateObject private var workoutData = WorkoutData(exercises:[])
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(workoutData)

        }
    }
}
