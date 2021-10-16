//
//  TodoListApp.swift
//  TodoList
//
//  Created by Anantasak on 16/10/2564 BE.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    @StateObject var todoListViewModel: TodoListViewModel = TodoListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TodoListView()
            }.environmentObject(todoListViewModel)
        }
    }
}
