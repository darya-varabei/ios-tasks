//
//  UserCoefficients.swift
//  Water Reminder
//
//  Created by Дарья Воробей on 11/22/21.
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
