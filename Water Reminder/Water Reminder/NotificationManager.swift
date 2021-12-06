//
//  Notification.swift
//  Water Reminder
//
//  Created by Дарья Воробей on 11/22/21.
//

import Foundation
import NotificationCenter

struct NotificationManager {
    let notificationCenter = UNUserNotificationCenter.current()
    let notificationTitle = NotificationParameter.title.rawValue
    let notificationBody = NotificationParameter.body.rawValue
    let identifier = NotificationParameter.identifier.rawValue
    let timeInterval: TimeInterval = NotificationParameter.interval
    
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
