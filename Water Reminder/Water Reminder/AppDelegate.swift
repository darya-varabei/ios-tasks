//
//  AppDelegate.swift
//  Water Reminder
//
//  Created by Darya on 11/9/21.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let notificationCenter = UNUserNotificationCenter.current()
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            
            notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) {(granted, error) in
                guard granted else { return }
                self.notificationCenter.getNotificationSettings { (settings) in
                    guard settings.authorizationStatus == .authorized else { return }
                }
            }
            return true
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

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

//    lazy var persistentContainer: NSPersistentContainer = {
//
//        let container = NSPersistentContainer(name: "Water_Reminder")
//        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//            if let error = error as NSError? {
//
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
//        })
//        return container
//    }()
//
//
//    func saveContext () {
//        let context = persistentContainer.viewContext
//        if context.hasChanges {
//            do {
//                try context.save()
//            } catch {
//                let nserror = error as NSError
//                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//            }
//        }
//    }

}

