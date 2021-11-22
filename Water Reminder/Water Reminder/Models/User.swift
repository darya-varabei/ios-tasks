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

enum WeightCoefficient: Double {
    case femaleCoef = 0.025
    case maleCoef = 0.03
    case otherCoef = 0.0275
}

enum ActivityCoefficient: Double {
    case femaleCoef = 0.4
    case maleCoef = 0.5
    case otherCoef = 0.45
}

class User {
    var weight: Double = 75
    var age: Int = 25
    var averageSportDurationADay: Double = 1
    var gender: Gender = .male
    var recommendedDoze: Double = 2750
    private let toMillilitres: Double = 1000
    
    static let shared = User()
    
    private init() { }
    
    func countRecommendedWater() {
        switch(gender) {
        case .female:
            self.recommendedDoze =  (self.weight * WeightCoefficient.femaleCoef.rawValue + self.averageSportDurationADay * ActivityCoefficient.femaleCoef.rawValue) * toMillilitres
        case .male:
            self.recommendedDoze =  (self.weight * WeightCoefficient.maleCoef.rawValue + self.averageSportDurationADay * ActivityCoefficient.maleCoef.rawValue) * toMillilitres
        case .other:
            self.recommendedDoze =  (self.weight * WeightCoefficient.otherCoef.rawValue + self.averageSportDurationADay * ActivityCoefficient.otherCoef.rawValue) * toMillilitres
        }
    }
}
