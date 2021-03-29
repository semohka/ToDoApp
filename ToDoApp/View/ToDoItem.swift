//
//  ToDoItem.swift
//  ToDoApp
//
//  Created by Кристина Семкова on 29.03.2021.
//

import Foundation
import CoreData

public class ToDoItem: NSManagedObject, Identifiable {
    @NSManaged public var name: String
    @NSManaged public var priority: String
    @NSManaged public var date: Date
    @NSManaged public var is_complited: Bool
}

extension ToDoItem {
    static func getAllToDoItems() -> NSFetchRequest<ToDoItem> {
        let request: NSFetchRequest<ToDoItem> = ToDoItem.fetchRequest() as! NSFetchRequest<ToDoItem>
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        return request
    }
}

