//
//  ContentView.swift
//  ToDoApp
//
//  Created by Кристина Семкова on 10.03.2021.
//

import SwiftUI

struct ContentView: View {

    @State private var showingAddTodoView: Bool = false
    var body: some View {
        NavigationView {
            List(0..<5) { item in
                Text("Row")
            }
            .navigationBarTitle(Text("Мои записи"), displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button(action: {
                                        self.showingAddTodoView.toggle()
                                    }) {
                                       Image(systemName: "plus")
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
