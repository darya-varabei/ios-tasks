//
//  String+ToDouble.swift
//  Water Reminder
//
//  Created by Дарья Воробей on 11/22/21.
//

import Foundation

extension String {
    public func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
}
