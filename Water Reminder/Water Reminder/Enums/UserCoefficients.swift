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
}

enum WeightCoefficient: Double {
    case femaleCoef = 0.025
    case maleCoef = 0.03
}

enum ActivityCoefficient: Double {
    case femaleCoef = 0.4
    case maleCoef = 0.5
}
