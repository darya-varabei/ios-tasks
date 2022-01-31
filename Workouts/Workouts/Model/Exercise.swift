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
}
