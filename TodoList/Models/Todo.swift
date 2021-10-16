//
//  Todo.swift
//  TodoList
//
//  Created by Anantasak on 16/10/2564 BE.
//

import Foundation

struct Todo: Identifiable {
    let id: String
    let title: String
    let isCompleted: Bool
    let timeStamp: Int64
    
    init (
        id: String = UUID().uuidString,
        title: String,
        isCompleted: Bool = false,
        timeStamp: Int64 = 0
    ) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.timeStamp = timeStamp
    }
    
    func updateComplete() -> Todo {
        return Todo(
            id: self.id,
            title: self.title,
            isCompleted: !self.isCompleted,
            timeStamp: self.timeStamp
        )
    }
}
