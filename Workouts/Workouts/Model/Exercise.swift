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
    @NSManaged fileprivate(set) var id: Int16
    @NSManaged fileprivate(set) var workout: Workout?
    
    static func findOrCreate(for idCode: Int16, in context: NSManagedObjectContext, workout: Workout, exercise: Exercise) -> Exercise {
        let predicate = NSPredicate(format: "%K == %d", #keyPath(id), Int(idCode))
        let exercise = findOrCreate(in: context, matching: predicate) {
            $0.name = exercise.name
            $0.targetArea = exercise.targetArea
            $0.repeats = exercise.repeats
            $0.sets = exercise.sets
            $0.id = exercise.id
            $0.workout = workout
            //$0.workout = Continent.findOrCreateContinent(for: isoCountry, in: context)
        }
        return exercise
    }
    
    static func addOnNewWorkout(in context: NSManagedObjectContext, workout: Workout, exercises: [Exercise]) -> NSSet{
        var items: Array<Exercise> = []
        for exercise in exercises {
            items.append(Exercise.findOrCreate(for: workout.id, in: context, workout: workout, exercise: exercise))
        }
        return NSSet(object: items)
    }

    override func prepareForDeletion() {
        guard let c = workout else { return }
        if c.exercises.filter({ !($0 as AnyObject).isDeleted }).isEmpty {
            managedObjectContext?.delete(c)
        }
    }
}

extension Exercise: Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(id), ascending: false)]
    }
}
