//
//  Workout.swift
//  Workouts
//
//  Created by Дарья Воробей on 1/31/22.
//

import Foundation
import CoreData

final class Workout: NSManagedObject {
    @NSManaged fileprivate(set) var name: String
    @NSManaged fileprivate(set) var dateLastCompleted: Date
    @NSManaged fileprivate(set) var id: UUID
    @NSManaged fileprivate(set) var exercises: NSSet
    
    var listExercises: [Exercise] {
        let set = exercises as? Set<Exercise> ?? []
        return set.sorted {
            $0.id.hashValue < $1.id.hashValue
        }
    }
    
    static func findOrCreateContinent(for workoutId: Int16, in context: NSManagedObjectContext, workout: Workout) -> Workout? {
       // guard let iso3166 = ISO3166.Continent(country: isoCountry) else { return nil }
        let predicate = NSPredicate(format: "%K == %d", #keyPath(dateLastCompleted), Int(workoutId))
        let continent = findOrCreate(in: context, matching: predicate) {
            $0.name = workout.name
            $0.dateLastCompleted = Date()
            $0.id = workout.id
            $0.exercises = workout.exercises
        }
        return continent
    }

}

extension Workout: Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(dateLastCompleted), ascending: false)]
    }
}
