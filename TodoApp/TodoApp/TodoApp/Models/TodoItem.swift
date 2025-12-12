//
//  TodoItem.swift
//  TodoApp
//
//  Created by 이승준 on 10/17/25.
//

import Foundation

struct TodoItem: Identifiable, Codable {
    var id = UUID()
    var title: String
    var notes: String
    var dueDate: Date
    var isCompleted: Bool = false
    var priority: Priority
    
    enum Priority: String, Codable, CaseIterable {
        case none = "없음"
        case low = "낮음"
        case high = "높음"
    }
    
    var isToday: Bool {
        Calendar.current.isDateInToday(dueDate)
    }
    
    var isUpcoming: Bool {
        !isToday && !isCompleted && dueDate > Date()
    }
}
