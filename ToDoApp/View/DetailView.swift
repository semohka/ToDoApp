//
//  DetailView.swift
//  ToDoApp
//
//  Created by Кристина Семкова on 04.04.2021.
//

import SwiftUI

struct DetailView: View {
    
    var item: ToDoItem
    
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm E, d MMM y"
        return formatter
    }()
    
    var body: some View {
        VStack {
            Text(item.name)
            Text(item.priority)
            Text("\(item.date, formatter: Self.taskDateFormat)")
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(item: ToDoItem())
    }
}
