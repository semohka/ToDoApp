//
//  ContentView.swift
//  ToDoApp
//
//  Created by Кристина Семкова on 10.03.2021.
//

import SwiftUI

struct ContentView: View {
    @State var list = ""
    
    var body: some View {
        NavigationView {
            Form {
                Text("Hello, world!")
            }
        }
        
          
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
