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
    case other
}

class User {
    var weight: Double = 75
    var age: Int = 25
    var averageSportDurationADay: Double = 1
    var gender: Gender = .male
    var recommendedDoze: Double = 2750
    
    static let shared = User()
    
    private init() { }
    
    func countRecommendedWater() {
        switch(gender) {
        case .female:
            self.recommendedDoze =  self.weight * 0.025 + self.averageSportDurationADay * 0.4
        case .male:
            self.recommendedDoze =  self.weight * 0.03 + self.averageSportDurationADay * 0.5
        case .other:
            self.recommendedDoze =  self.weight * 0.0275 + self.averageSportDurationADay * 0.45
        }
    }
}
