//
//  TodoListViewModel.swift
//  TodoList
//
//  Created by Anantasak on 16/10/2564 BE.
//

import Foundation

class TodoListViewModel: ObservableObject {
    
    @Published var items: [Todo] = []
    
    init() {
        loadData()
    }
    
    func loadData() {
        items.append(
            contentsOf: [
                Todo(title: "First", isCompleted: false),
                Todo(title: "Second", isCompleted: true)
            ]
        )
    }
    
    func move(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func delete(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func updateComplete(item: Todo) {
        if let index = items.firstIndex(where: { $0.id == item.id } ) {
            items[index] = item.updateComplete()
        }
    }
    
    func addTask(title: String) {
        items.append(Todo(title: title))
    }
}
