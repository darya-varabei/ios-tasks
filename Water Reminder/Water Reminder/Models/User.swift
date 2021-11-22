//
//  User.swift
//  Water Reminder
//
//  Created by Darya on 11/9/21.
//

import Foundation

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
            recommendedDoze =  (weight * WeightCoefficient.femaleCoef.rawValue + averageSportDurationADay * ActivityCoefficient.femaleCoef.rawValue) * toMillilitres
        case .male:
            recommendedDoze =  (weight * WeightCoefficient.maleCoef.rawValue + averageSportDurationADay * ActivityCoefficient.maleCoef.rawValue) * toMillilitres
        case .other:
            recommendedDoze =  (weight * WeightCoefficient.otherCoef.rawValue + averageSportDurationADay * ActivityCoefficient.otherCoef.rawValue) * toMillilitres
        }
    }
}
