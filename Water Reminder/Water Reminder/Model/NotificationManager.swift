//
//  Notification.swift
//  Water Reminder
//
//  Created by Дарья Воробей on 11/22/21.
//

import Foundation
import NotificationCenter

struct NotificationManager {
    private let notificationCenter = UNUserNotificationCenter.current()
    private let notificationTitle = NotificationParameter.title.rawValue
    private let notificationBody = NotificationParameter.body.rawValue
    private let identifier = NotificationParameter.identifier.rawValue
    private let timeInterval: TimeInterval = NotificationParameter.interval
    
    private enum NotificationParameter: String {
        case title = "Water reminder"
        case body = "It's time to drink some water"
        case identifier = "notification"
        static let interval: TimeInterval = 10800
    }
    
    func requestAuthorization() {
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            guard granted else { return }
            self.notificationCenter.getNotificationSettings { (settings) in
                guard settings.authorizationStatus == .authorized else { return }
            }
        }
        sendNotifications()
    }
    
    func sendNotifications() {
        
        let content = UNMutableNotificationContent()
        content.title = notificationTitle
        content.body = notificationBody
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: true)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        notificationCenter.add(request) { (error) in
        }
    }
}
