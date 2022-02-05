//
//  Date+Format.swift
//  Workouts
//
//  Created by Дарья Воробей on 2/6/22.
//

import Foundation

extension Date {
   func getFormattedDate() -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = "HH:mm:ss"
        return dateformat.string(from: self)
    }
}
