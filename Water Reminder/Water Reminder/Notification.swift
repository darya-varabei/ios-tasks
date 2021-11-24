//
//  Notification.swift
//  Water Reminder
//
//  Created by Дарья Воробей on 11/22/21.
//

import Foundation
import NotificationCenter

class Notification {
    let notificationCenter = UNUserNotificationCenter.current()
    let notificationTitle = "Water reminder"
    let notificationBody = "It's time to drink some water"
    let identifier = "notification"
    let timeInterval: TimeInterval = 10800
    
    func requestAuthorization() {
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            guard granted else { return }
            self.notificationCenter.getNotificationSettings { (settings) in
                guard settings.authorizationStatus == .authorized else { return }
            }
        }
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
