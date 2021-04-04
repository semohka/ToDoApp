//
//  AddContentView.swift
//  ToDoApp
//
//  Created by Кристина Семкова on 11.03.2021.
//

import SwiftUI

struct AddContentView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var managedOdjectContext

    
    @State var name: String = ""
    @State var priority: String = ""
    @State var date: Date = Date()
    
        
    let priorities = ["Срочно", "Может подождать"]
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Наименование", text: $name)
                    DatePicker("Дата", selection: $date)
                    Picker ("Приоритет", selection: $priority) {
                        ForEach(priorities, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    Button(action: {
                        let dataContent = ToDoItem(context: self.managedOdjectContext)
                        
                        
                        dataContent.name = name
                        dataContent.priority = priority
                        dataContent.date = date
                        
                        do {
                            try self.managedOdjectContext.save()
                        }catch{
                           print(error)
                        }

                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        HStack {
                            Spacer()
                            Text("Сохранить")
                            Spacer()
                        }

                    })
                }
                Spacer()
            }
            .navigationBarTitle("Новая запись", displayMode: .inline)            
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




// приблуда для свайпа 
//.gesture(
//        DragGesture()
//          .onEnded {
//            if $0.translation.width < -100 {
//              item.sort {i}
//            } else if $0.translation.width > 100 {
//              print(«right»)
//            }
//        }
//      )
