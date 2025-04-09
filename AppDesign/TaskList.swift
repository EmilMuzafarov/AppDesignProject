//
//  TaskList.swift
//  AppDesign
//
//  Created by Student on 4/9/25.
//

import SwiftUI
import SwiftData

struct Tasks: View {
    @State private var desc = ""
    @State private var newDate = Date.now
    @Query(sort: \Task.title) private var tasks: [Task]
    @Environment(\.modelContext) private var context
    var body: some View {
        Text("Tasks:")
            .font(.title)
            .fontWeight(.semibold)
            .foregroundStyle(.black)
        VStack {
            NavigationSplitView {
                List {
                    
                }
                Text("Add Task")
                    .font(.headline)
                HStack{
                    DatePicker(selection: $newDate) {
                        TextField("Description", text: $desc)
                            .textFieldStyle(.roundedBorder)
                    }
                    Button("Add", systemImage: "plus.app") {
                        let newTask = Task(title: desc, dueDate: newDate, isDone: false)
                        context.insert(newTask)
                        desc = ""
                    }
                    .padding(5)
                    .foregroundColor(Color.blue)
                    .background(Color.white)
                    .cornerRadius(5)
                }
            } detail: {
                Text("Select a Song")
                    .navigationTitle("Song")
            }
        }
    }
}

#Preview {
    Tasks()
}
