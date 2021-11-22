//
//  UserDefaults+Date.swift
//  Water Reminder
//
//  Created by Дарья Воробей on 11/22/21.
//

import Foundation

extension UserDefaults {
    
    static let defaults = UserDefaults.standard
    
    static var lastAccessDate: Date? {
        get {
            return defaults.object(forKey: UserParameters.lastAccessDate.rawValue) as? Date
        }
        set {
            guard let newValue = newValue else { return }
            guard let lastAccessDate = lastAccessDate else {
                defaults.set(newValue, forKey: UserParameters.lastAccessDate.rawValue)
                return
            }
            if !Calendar.current.isDateInToday(lastAccessDate) {
                UserDefaults.standard.setValue(0.0, forKey: UserParameters.todayTotal.rawValue)
                UserDefaults.standard.setValue(0.0, forKey:  UserParameters.todayClear.rawValue)
            }
            defaults.set(newValue, forKey: UserParameters.lastAccessDate.rawValue)
        }
    }
    
    static func reset() {
        defaults.removePersistentDomain(forName: Bundle.main.bundleIdentifier ?? "")
    }
}
