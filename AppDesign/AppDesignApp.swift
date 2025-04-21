//
//  AppDesignApp.swift
//  AppDesign
//
//  Created by Student on 4/8/25.
//

import SwiftUI

@main
struct AppDesignApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Task.self])
    }
}
