//
//  Service.swift
//  Workouts
//
//  Created by Дарья Воробей on 2/9/22.
//

import Foundation
import CoreData

class Service {
    static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? { return }
        })
        return container
    }()
    
    var managedObjectContext: NSManagedObjectContext = Service.persistentContainer.viewContext
    var request: NSFetchedResultsController<Session>?
    
    func performInsert(name: String, time: Date, typeOfClass: String, info: String, coach: String) {
        managedObjectContext.performChanges {
            let _ = Session.insert(into: self.managedObjectContext, name: name, time: time, typeOfClass: typeOfClass, info: info, coach: coach)
        }
    }
    
    func performUpdate(object: Session, name: String, time: Date, typeOfClass: String, info: String, coach: String) {
        managedObjectContext.performChanges {
            let _ = Session.update(into: self.managedObjectContext, object: object , name: name, time: time, typeOfClass: typeOfClass, info: info, coach: coach)
        }
    }
    
    func createRequest() -> NSFetchedResultsController<Session> {
        request = Session.sortedFetchRequest(managedObjectContext: managedObjectContext)
        guard let result = request else { fatalError() }
        return result
    }
}
