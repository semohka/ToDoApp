//
//  ContentView.swift
//  ToDoApp
//
//  Created by Кристина Семкова on 10.03.2021.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedOdjectContext
    @FetchRequest(fetchRequest: ToDoItem.getAllToDoItems()) var toDoItems: FetchedResults<ToDoItem>
    
    @State private var showingAddTodoView: Bool = false
    var body: some View {
        NavigationView {
            List {
                ForEach(toDoItems, id: \.name) { item in
                    NavigationLink(destination: UpdateView(toDoItem: item).environment(\.managedObjectContext, managedOdjectContext)){
                        DetailView(item: item)

                    }
                        
                        .foregroundColor(item.is_complited ? .secondary : .primary)
                        .gesture(
                            DragGesture()
                                .onEnded {
                                    if $0.translation.width > 100 {
                                        item.is_complited = true
                                        try? self.managedOdjectContext.save()
                                    }
                                }
                        )
                        
                }
                .onDelete { indexSet in
                     for index in indexSet {
                        self.managedOdjectContext.delete(toDoItems[index])
                        try? self.managedOdjectContext.save()
                     }
                 }
            }

            
            .navigationBarTitle(Text("Мои записи"), displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button(action: {
                                        self.showingAddTodoView.toggle()
                                    }) {
                                        Image(systemName: "plus.circle.fill")
                                            .foregroundColor(.green)
                                            .imageScale(.large)
                                    })
            .sheet(isPresented: $showingAddTodoView) {
                AddContentView()
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
