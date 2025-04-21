//
//  SampleData.swift
//  AppDesign
//
//  Created by Student on 4/9/25.
//

import Foundation
import SwiftData

@MainActor
class SampleData {
    static let shared = SampleData()
    let modelContainer: ModelContainer

    var context: ModelContext {
        modelContainer.mainContext
    }
    var task: Task {
        Task.sampleData.first!
    }
    private init() {
        let schema = Schema([
            Task.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            insertSampleData()
            try context.save()
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    private func insertSampleData() {
        for task in Task.sampleData {
            context.insert(task)
        }
    }
}

