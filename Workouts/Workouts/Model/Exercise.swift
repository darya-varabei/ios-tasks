//
//  Exercise.swift
//  Workouts
//
//  Created by Дарья Воробей on 1/31/22.
//

import Foundation
import CoreData

final class Exercise: NSManagedObject {
    @NSManaged fileprivate(set) var name: String
    @NSManaged fileprivate(set) var targetArea: String
    @NSManaged fileprivate(set) var repeats: Int16
    @NSManaged fileprivate(set) var sets: Int8
    @NSManaged fileprivate(set) var id: UUID
    
    static func findOrCreate(for idCode: UUID, in context: NSManagedObjectContext) -> Exercise {
        let predicate = NSPredicate(format: "%K == %d", #keyPath(id), Int(idCode))
        let country = findOrCreate(in: context, matching: predicate) {
            $0.iso3166Code = isoCountry
            $0.updatedAt = Date()
            $0.continent = Continent.findOrCreateContinent(for: isoCountry, in: context)
        }
        return country
    }

    override func prepareForDeletion() {
        guard let c = continent else { return }
        if c.countries.filter({ !$0.isDeleted }).isEmpty {
            managedObjectContext?.delete(c)
        }
    }
}
