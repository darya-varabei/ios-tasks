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

//    var updatedObjects: Set<NSManagedObject> {
//        return objects(forKey: NSUpdatedObjectsKey)
//    }

//    var deletedObjects: Set<NSManagedObject> {
//        return objects(forKey: NSDeletedObjectsKey)
//    }

//    var refreshedObjects: Set<NSManagedObject> {
//        return objects(forKey: NSRefreshedObjectsKey)
//    }

//    var invalidatedObjects: Set<NSManagedObject> {
//        return objects(forKey: NSInvalidatedObjectsKey)
//    }

//    var invalidatedAllObjects: Bool {
//        return (notification as NSNotification).userInfo?[NSInvalidatedAllObjectsKey] != nil
//    }

    var managedObjectContext: NSManagedObjectContext {
        guard let c = notification.object as? NSManagedObjectContext else { fatalError("Invalid notification object") }
        return c
    }

    fileprivate let notification: Notification

    fileprivate func objects(forKey key: String) -> Set<NSManagedObject> {
        return ((notification as NSNotification).userInfo?[key] as? Set<NSManagedObject>) ?? Set()
    }

}
