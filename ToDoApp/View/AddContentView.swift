//
//  AddContentView.swift
//  ToDoApp
//
//  Created by Кристина Семкова on 11.03.2021.
//

import SwiftUI

struct AddContentView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var dataContent = DataContent()
    
    @Binding var updateList: [DataContent]
    
    let priorities = ["Срочно", "Может подождать"]
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Наименование", text: $dataContent.name)
                    DatePicker("Дата", selection: $dataContent.date)
                    Picker ("Приоритет", selection: $dataContent.priority) {
                        ForEach(priorities, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    Button(action: {
                        self.updateList.append(dataContent)
                        self.updateList.sort(by: { !$0.is_complited && $1.is_complited } )

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
        AddContentView(updateList: .constant([]))
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
