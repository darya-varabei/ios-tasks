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
}
