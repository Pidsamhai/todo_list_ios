//
//  TodoItem.swift
//  TodoList
//
//  Created by Anantasak on 16/10/2564 BE.
//

import SwiftUI

struct TodoItem: View {
    
    let item: Todo
    
    var body: some View {
        HStack {
            Image(
                systemName: item.isCompleted ?
                "checkmark.circle.fill" : "circle"
            ).foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
        }
    }
}

struct TodoItem_Previews: PreviewProvider {
    
    static var item1: Todo = Todo(
        title: "Title",
        isCompleted: false
    )
    
    static var item2: Todo = Todo(
        title: "Title",
        isCompleted: true
    )
    
    static var previews: some View {
        Group{
            TodoItem(item: item1)
            TodoItem(item: item2)
        }.previewLayout(.sizeThatFits)
    }
}
