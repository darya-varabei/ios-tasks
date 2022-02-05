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
    @NSManaged fileprivate(set) var time: Date
    @NSManaged fileprivate(set) var info: String
    @NSManaged fileprivate(set) var type: String
    @NSManaged fileprivate(set) var coach: String

    public static func insert(into context: NSManagedObjectContext, name: String, time: Date, typeOfClass: String, info: String, coach: String) -> Session {
        let workout: Session = context.insertObject()
        workout.name = name
        workout.time = Date()
        workout.type = typeOfClass
        workout.info = info
        workout.coach = coach
        return workout
    }
}

extension Session: Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(name), ascending: false)]
    }
}
