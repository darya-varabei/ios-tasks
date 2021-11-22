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
    
    func requestAuthorization() {
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) {(granted, error) in
            guard granted else { return }
            self.notificationCenter.getNotificationSettings { (settings) in
                guard settings.authorizationStatus == .authorized else { return }
            }
        }
    }
    
    func sendNotifications() {
        
        let content = UNMutableNotificationContent()
        content.title = "Water reminder"
        content.body = "It's time to drink some water"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10800, repeats: true)
        let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
        notificationCenter.add(request) { (error) in
        }
    }
}
