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
    @NSManaged fileprivate(set) var id: Int16
    @NSManaged fileprivate(set) var exercises: NSSet
    @NSManaged fileprivate(set) var targerAreas: String
    
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
            $0.targerAreas = workout.targerAreas
        }
        return continent
    }

    public static func insert(into context: NSManagedObjectContext, name: String, exercises: [Exercise], targetAreas: String) -> Workout {
        let workout: Workout = context.insertObject()
        workout.name = name
        workout.dateLastCompleted = Date()
        workout.targerAreas = targetAreas
        workout.exercises = Exercise.addOnNewWorkout(in: context, workout: workout, exercises: exercises)
        return workout
    }

//    override public func prepareForDeletion() {
//        if country.moods.filter({ !$0.isDeleted }).isEmpty {
//            managedObjectContext?.delete(country)
//        }
//    }
}

extension Workout: Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(dateLastCompleted), ascending: false)]
    }
}
