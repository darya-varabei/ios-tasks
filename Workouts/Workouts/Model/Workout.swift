//
//  Workout.swift
//  Workouts
//
//  Created by Дарья Воробей on 1/31/22.
//

import Foundation
import CoreData

final class Session: NSManagedObject {
    @NSManaged fileprivate(set) var name: String
    @NSManaged fileprivate(set) var dateLastCompleted: Date
    @NSManaged fileprivate(set) var id: Int16
    @NSManaged fileprivate(set) var exercises: [String]
    @NSManaged fileprivate(set) var targerAreas: [String]

    public static func insert(into context: NSManagedObjectContext, name: String, exercises: [String], targetAreas: [String]) -> Session {
        let workout: Session = context.insertObject()
        workout.name = name
        workout.dateLastCompleted = Date()
        //workout.targerAreas = [""]
        //workout.exercises = exercises
        return workout
    }
}

extension Session: Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(dateLastCompleted), ascending: false)]
    }
}
