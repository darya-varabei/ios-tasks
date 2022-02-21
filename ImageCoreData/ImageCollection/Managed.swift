//
//  Managed.swift
//  ImageCollection
//
//  Created by Дарья Воробей on 22.02.22.
//

import Foundation
import CoreData

protocol Managed: class, NSFetchRequestResult {
    static var entityName: String { get }
    static var defaultSortDescriptors: [NSSortDescriptor] { get }
}

extension Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return []
    }

    static func sortedFetchRequest(managedObjectContext: NSManagedObjectContext) -> NSFetchedResultsController<Self> {
        let request = NSFetchRequest<Self>(entityName: entityName)
        request.sortDescriptors = defaultSortDescriptors
        request.fetchBatchSize = 20
        return NSFetchedResultsController(fetchRequest: request, managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
    }
}


extension Managed where Self: NSManagedObject {
    static var entityName: String { return entity().name ?? "Session" }
}
