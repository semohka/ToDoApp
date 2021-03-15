//
//  AddContentView.swift
//  ToDoApp
//
//  Created by Кристина Семкова on 11.03.2021.
//

import SwiftUI

struct AddContentView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name: String = ""
    @State private var priority: String = "Срочно"
    
    let priorities = ["Срочно", "Может подождать"]
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Наименование", text: $name)
                    Picker ("Приоритет", selection: $priority) {
                        ForEach(priorities, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    Button(action: {
//                        print("Save a new todo item")
                    }, label: {
                        Text("Сохранить")
                    })
                }
                Spacer()
            }
            .navigationBarTitle("Новая запись", displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button(action: {
                                        self.presentationMode.wrappedValue.dismiss()
                                    }) {
//                                        Image(systemName: "xmark")
                                    })
            
        }
        

    }
}

struct AddContentView_Previews: PreviewProvider {
    static var previews: some View {
        AddContentView()
    }
}






//            Form {
//                TextField("Название продукта", text: $name)
//                    .keyboardType(.decimalPad) //вводит цифры а не буквы
//                TextField("Название продукта", text: $name)
//                TextField("Название продукта", text: $name)
//                TextField("Название продукта", text: $name)
//            }
//            .navigationBarTitle("Создание нового чека")
//            Picker("Выбери свой магазин", selection: $selecledShop){
//                ForEach(0..<shops.count){
//                    Text(self.shops[$0])
//                }
//
//            }
