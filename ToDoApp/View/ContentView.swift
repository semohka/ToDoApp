//
//  ContentView.swift
//  ToDoApp
//
//  Created by Кристина Семкова on 10.03.2021.
//

import SwiftUI

struct ContentView: View {

    @State private var showingAddTodoView: Bool = false
    @State private var list = [String]()
    var body: some View {
        NavigationView {
      
                List(list, id: \.self) { item in
                    Text(item)
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
    
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(list: [""])
//    }
//}
