//
//  Task+Convenience.swift
//  Task-CoreData
//
//  Created by Myles Cashwell on 4/27/21.
//

import CoreData

extension Task {
    @discardableResult convenience init(name: String, notes: String? = nil, dueDate: Date? = nil, isComplete: Bool = false, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
        self.notes = notes
        self.dueDate = dueDate
        self.isComplete = isComplete
    }
}
