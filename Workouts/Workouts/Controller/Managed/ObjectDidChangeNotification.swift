//
//  ObjectDidChangeNotification.swift
//  Workouts
//
//  Created by Дарья Воробей on 2/1/22.
//

import Foundation
import CoreData

struct ObjectsDidChangeNotification {

    init(note: Notification) {
        assert(note.name == NSNotification.Name.NSManagedObjectContextObjectsDidChange)
        notification = note
    }

    var insertedObjects: Set<NSManagedObject> {
        return objects(forKey: NSInsertedObjectsKey)
    }

    fileprivate let notification: Notification

    fileprivate func objects(forKey key: String) -> Set<NSManagedObject> {
        return ((notification as NSNotification).userInfo?[key] as? Set<NSManagedObject>) ?? Set()
    }

}
