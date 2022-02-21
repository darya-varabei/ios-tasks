//
//  Service.swift
//  ImageCollection
//
//  Created by Дарья Воробей on 22.02.22.
//

import Foundation
import CoreData

class CoreDataService {
    static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? { return }
        })
        return container
    }()
    
    var managedObjectContext: NSManagedObjectContext = CoreDataService.persistentContainer.viewContext
    var request: NSFetchedResultsController<Photo>?
    
    func performInsert(image: Data) {
        managedObjectContext.performChanges {
            let _ = Photo.insert(into: self.managedObjectContext, newImage: image)
        }
    }
    
//    func performUpdate(object: Session, name: String, time: Date, typeOfClass: String, info: String, coach: String) {
//        managedObjectContext.performChanges {
//            let _ = Session.update(into: self.managedObjectContext, object: object , name: name, time: time, typeOfClass: typeOfClass, info: info, coach: coach)
//        }
//    }
    
    func createRequest() -> NSFetchedResultsController<Photo> {
        request = Photo.sortedFetchRequest(managedObjectContext: managedObjectContext)
        guard let result = request else { fatalError() }
        return result
    }
}
