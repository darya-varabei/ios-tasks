//
//  Extensions.swift
//  Water Reminder
//
//  Created by Darya on 11/12/21.
//

import Foundation

extension UserDefaults {
    
    static let defaults = UserDefaults.standard
    
    static var lastAccessDate: Date? {
        get {
            return defaults.object(forKey: "lastAccessDate") as? Date
        }
        set {
            guard let newValue = newValue else { return }
            guard let lastAccessDate = lastAccessDate else {
                defaults.set(newValue, forKey: "lastAccessDate")
                return
            }
            if !Calendar.current.isDateInToday(lastAccessDate) {
                print("remove Persistent Domain")
                UserDefaults.standard.setValue(0.0, forKey: "todayTotal")
            }
            defaults.set(newValue, forKey: "lastAccessDate")
        }
    }
    
    static func reset() {
        defaults.removePersistentDomain(forName: Bundle.main.bundleIdentifier ?? "")
    }
}

extension String {
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
}
