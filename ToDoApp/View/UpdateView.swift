//
//  UpdateView.swift
//  ToDoApp
//
//  Created by Кристина Семкова on 04.04.2021.
//

import SwiftUI

struct UpdateView: View {
    @Environment(\.presentationMode) var presentationMode

    @Environment(\.managedObjectContext) var managedOdjectContext
    @State var toDoItem: ToDoItem
    let priorities = ["Срочно", "Может подождать"]

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Наименование", text: $toDoItem.name)
                    DatePicker("Дата", selection: $toDoItem.date)
                    Toggle("Выполнено", isOn: $toDoItem.is_complited)
                    Picker ("Приоритет", selection: $toDoItem.priority) {
                        ForEach(priorities, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    Button(action: {

                        do {
                            try self.managedOdjectContext.save()
                            self.presentationMode.wrappedValue.dismiss()
                        }catch{
                           print(error)
                        }

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
            .navigationBarTitle("Редактирование", displayMode: .inline)
        }
        

    }
}

struct UpdateView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateView(toDoItem: ToDoItem())
    }
}
