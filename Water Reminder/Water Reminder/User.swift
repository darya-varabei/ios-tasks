//
//  User.swift
//  Water Reminder
//
//  Created by Darya on 11/9/21.
//

import Foundation

enum Gender {
    case male
    case female
    case undefined
}

class User {
    var weight: Double
    var age: Int
    var averageSportDurationADay: Double
    var gender: Gender
    
    public init(weight: Double, age: Int, averageSportDurationADay: Double, gender: Gender) {
        self.weight = weight
        self.age = age
        self.averageSportDurationADay = averageSportDurationADay
        self.gender = gender
    }
}
