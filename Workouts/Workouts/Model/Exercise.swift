//
//  Exercise.swift
//  Workouts
//
//  Created by Дарья Воробей on 1/31/22.
//

import Foundation

struct Exercise {
    private var name: String
    private var sets: Int
    private var repeats: Int
    
    func getName() -> String {
        return name
    }
    
    func getSets() -> Int {
        return sets
    }
    
    func getRepeats() -> Int {
        return repeats
    }
    
    mutating func setName(newName: String) {
        name = newName
    }
    
    mutating func setSets(newSets: Int) {
        sets = newSets
    }
    
    mutating func setRepeats(newRepeats: Int) {
        repeats = newRepeats
    }
    
    func description() -> String {
        return "\(name),  \(sets)x\(repeats)"
    }
    
    func stringForStoring(exercise: Exercise) -> String {
        return "\(exercise.name)+\(exercise.sets)+\(exercise.repeats)"
    }
}
