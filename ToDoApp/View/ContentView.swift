//
//  ContentView.swift
//  ToDoApp
//
//  Created by Кристина Семкова on 10.03.2021.
//

import SwiftUI

struct ContentView: View {
    
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm E, d MMM y"
        return formatter
    }()
    
    
    @State private var showingAddTodoView: Bool = false
    @State private var list = [DataContent]()
    var body: some View {
        NavigationView {
            List {
                ForEach(list, id: \.name) { item in
                   
                        VStack {
                            Text(item.name)
                            Text(item.priority)
                            Text("\(item.date, formatter: Self.taskDateFormat)")
                        }
                        
                        .foregroundColor(item.is_complited ? .secondary : .primary)
                        .gesture(
                            DragGesture()
                                .onEnded {
                                    if $0.translation.width > 100 {
                                        item.is_complited = true
                                        self.list.sort(by: { !$0.is_complited && $1.is_complited } )
                                    }
                                }
                        )
                        
                }
                .onDelete(perform: deleteItems)
            }

            
            .navigationBarTitle(Text("Мои записи"), displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button(action: {
                                        self.showingAddTodoView.toggle()
                                    }) {
                                        Image(systemName: "plus")
                                    })
            .sheet(isPresented: $showingAddTodoView) {
                AddContentView(updateList: $list)
                
            }
            
        }
    }
    private func deleteItems(at indexSet: IndexSet) {
        self.list.remove(atOffsets: indexSet)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
