//
//  AppDelegate.swift
//  Water Reminder
//
//  Created by Darya on 11/9/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let notificationCenter = NotificationManager()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        notificationCenter.requestAuthorization()
        notificationCenter.sendNotifications()
        return true
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}

