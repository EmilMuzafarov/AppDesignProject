//
//  TaskList.swift
//  AppDesign
//
//  Created by Student on 4/9/25.
//

import SwiftUI
import SwiftData

struct TaskList: View {
    
    @State private var desc = ""
    @State private var newDate = Date.now
    @Query(sort: \Task.title) private var tasks: [Task]
    @Environment(\.modelContext) private var context
    var body: some View {
        Text("Tasks:")
            .font(.title)
            .fontWeight(.semibold)
            .foregroundStyle(.black)
        VStack(alignment: .leading) {
            NavigationSplitView {
                Group {
                    if !tasks.isEmpty {
                        List {
                            ForEach(tasks) { task in
                                HStack {
                                    VStack(alignment: .leading) {
                                        NavigationLink(task.title) {
                                            TaskDetail(task:task)
                                        }
                                        .strikethrough(task.isDone)
                                        .foregroundColor(task.isDone ? .secondary : .primary)
                                        Text("\(task.dueDate)")
                                            .foregroundColor(.secondary)
                                    }
                                    Button {
                                                task.isDone.toggle()
                                                withAnimation(.linear(duration: 1)) {
                                                    context.delete(task)
                                                    try? context.save()
                                                }
                                            } label: {
                                                HStack {
                                                    Image(systemName: task.isDone ? "checkmark.square" : "square")
                                                        .foregroundColor(task.isDone ? .green : .gray)
                                                }
                                            }
                                            .buttonStyle(.plain)
                                    Spacer()
                                }
                            }
                        }
                    } else {
                        ContentUnavailableView("Add Tasks", systemImage: "document.on.clipboard")
                    }
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
                        print(context)
                        desc = ""
                    }
                    .padding(5)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(5)
                }
            } detail: {
                Text("Select a task")
                    .navigationTitle("Task")
            }
        }
    }
}

#Preview {
    TaskList()
        .modelContainer(SampleData.shared.modelContainer)
}
