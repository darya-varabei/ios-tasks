//
//  User.swift
//  Water Reminder
//
//  Created by Darya on 11/9/21.
//

import Foundation

class User {
    
    private let toMillilitres: Double = 1000
    private var weight: Double = 75
    private var age: Int = 25
    private var averageSportDurationADay: Double = 0.0
    private var gender: Gender = .male
    private var recommendedDoze: Double = 2750
    
    static let shared = User()
    
    private init() { }
    
    func countRecommendedWater() {
        switch(gender) {
        case .female:
            recommendedDoze =  (weight * WeightCoefficient.femaleCoef.rawValue + averageSportDurationADay * ActivityCoefficient.femaleCoef.rawValue) * toMillilitres
        case .male:
            recommendedDoze =  (weight * WeightCoefficient.maleCoef.rawValue + averageSportDurationADay * ActivityCoefficient.maleCoef.rawValue) * toMillilitres
        }
    }
    
    func getWeight() -> Double {
        return weight
    }
    
    func setWeight(newWeight: Double) {
        weight = newWeight
    }
    
    func getActivity() -> Double {
        return averageSportDurationADay
    }
    
    func setActivity(newActivity: Double) {
        averageSportDurationADay = newActivity
    }
    
    func getGender() -> Gender {
        return gender
    }
    
    func setGender(newGender: Gender) {
        gender = newGender
    }
    
    func getRecommendedDoze() -> Double {
        return recommendedDoze
    }
    
    func setRecommendedDoze(newDoze: Double) {
        recommendedDoze = newDoze
    }
}
