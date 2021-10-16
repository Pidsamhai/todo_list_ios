//
//  AddView.swift
//  TodoList
//
//  Created by Anantasak on 16/10/2564 BE.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var todoListViewModel: TodoListViewModel
    @State var taskTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                
                TextField("Name", text: $taskTitle)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.931))
                    .cornerRadius(10)
                
                Button {
                    preventSave()
                } label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }

            }.padding()
        }
        .navigationTitle("Add new task")
        .alert(isPresented: $showAlert, content: emptyTextAlert)
    }
    
    func preventSave() {
        showAlert = taskTitle.trimmingCharacters(in: .whitespacesAndNewlines).count == 0
        if !showAlert {
            todoListViewModel.addTask(title: taskTitle)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(TodoListViewModel())
    }
}
