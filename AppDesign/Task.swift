//
//  Task.swift
//  AppDesign
//
//  Created by Student on 4/9/25.
//

import Foundation
import SwiftData

@Model
class Task {
    var title: String
    var dueDate: Date
    var isDone: Bool


    init(title: String, dueDate: Date, isDone: Bool) {
        self.title = title
        self.dueDate = dueDate;
        self.isDone = isDone
    }
}
