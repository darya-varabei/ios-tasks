//
//  NotificationParameters.swift
//  Water Reminder
//
//  Created by Дарья Воробей on 11/28/21.
//

import Foundation

enum NotificationParameter: String {
    case title = "Water reminder"
    case body = "It's time to drink some water"
    case identifier = "notification"
    static let interval: TimeInterval = 10800
}
