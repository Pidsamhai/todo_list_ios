//
//  ContentView.swift
//  TodoList
//
//  Created by Anantasak on 16/10/2564 BE.
//

import SwiftUI

struct TodoListView: View {
    
    @EnvironmentObject var todoListViewModel: TodoListViewModel
    
    var body: some View {
        List  {
            ForEach(todoListViewModel.items)  { item in
                TodoItem(item: item)
                    .onTapGesture {
                        withAnimation(.linear) {
                            todoListViewModel.updateComplete(item: item)
                        }
                    }
            }
            .onDelete(perform: todoListViewModel.delete)
            .onMove(perform: todoListViewModel.move)
            
            if todoListViewModel.items.count == 0 {
                Text("No task 😊")
                    .frame(maxWidth: .infinity)
                    .frame(alignment: .center)
            }
        }
        .navigationBarTitle("Todo List")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddView())
        )
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            TodoListView()
        }.environmentObject(TodoListViewModel())
    }
}
