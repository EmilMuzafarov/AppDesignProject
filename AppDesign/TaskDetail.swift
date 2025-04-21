//
//  TaskDetail.swift
//  AppDesign
//
//  Created by Student on 4/11/25.
//

import SwiftUI
import SwiftData

struct TaskDetail: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    var task: Task
    @State private var isDone:Bool
    @State private var title:String
    @State private var dueDate=Date.now
    @State private var textFieldTyped: String = ""
    init(task: Task) {
        self.task = task
        title = task.title
        dueDate = task.dueDate
        isDone = task.isDone
    }
    var body: some View {
        VStack {
            HStack{
                Text("Task: ")
                    .bold()
                TextField("", text:$title)
                    .fontWeight(.regular)
            }
            HStack{
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
                    .bold()
            }
            Toggle("Done?", isOn: $isDone)
            Button("Save") {
                task.title = title
                task.dueDate = dueDate
                task.isDone = isDone
                dismiss()
            }
            .padding(5)
            .foregroundColor(Color.white)
            .background(Color.green)
            .cornerRadius(5)
        }
        .navigationTitle("Update Task Details")
        .bold()
    }
}
#Preview {
    TaskDetail(task: Task(title: "Do Homework", dueDate: Date.now, isDone: false))
        .modelContainer(SampleData.shared.modelContainer)
}
