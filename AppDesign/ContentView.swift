//
//  ContentView.swift
//  AppDesign
//
//  Created by Student on 4/8/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Game", systemImage: "gamecontroller.fill") {
                Game()
            }
            Tab("Tasks", systemImage: "list.bullet.clipboard") {
                TaskList()
            }
        }
    }
}
#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
