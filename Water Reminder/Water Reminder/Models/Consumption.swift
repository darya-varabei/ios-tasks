//
//  Consumption.swift
//  Water Reminder
//
//  Created by Darya on 11/10/21.
//

import Foundation

struct Consumption {
    let user = User.shared
    var recentItemsVolume: [Option] = []
    private var totalToday: Int = 0
    private var totalClearToday: Int = 0
    
    mutating func addRecentItems(item: Option) {
        recentItemsVolume.append(item)
        totalToday += item.volume
        
        if item.isClearWater {
            totalClearToday += item.volume
        }
    }
    
    mutating func cancelRecentItem() -> Option {
        if !recentItemsVolume.isEmpty {
            let lastItem = recentItemsVolume.last
            recentItemsVolume.removeLast()
            totalToday -= lastItem?.volume ?? 0
            
            if ((lastItem?.isClearWater) != nil) {
                 totalClearToday -= lastItem?.volume ?? 0
            }
            return lastItem ?? Option(volume: 0)
            
        }
        else {
            return Option(volume: 0)
        }
    }
    
    func totalTodayPercent() -> Double {
        let total: Double = Double(totalToday)
        return total / user.recommendedDoze
    }
    
    func totalTodayClearPercent() -> Double {
        let total: Double = Double(totalClearToday)
        return total / user.recommendedDoze
    }
    
    func initUser() {
        guard UserDefaults.standard.double(forKey: "bodyweight") == 0 else {
            user.weight = UserDefaults.standard.double(forKey: "bodyweight")
            user.averageSportDurationADay = UserDefaults.standard.double(forKey: "activity")
            user.recommendedDoze = UserDefaults.standard.double(forKey: "doze")
            return
        }
    }
    
    mutating func fetchUserStoredData() {
        totalToday = Int(UserDefaults.standard.double(forKey: "todayTotal"))
        totalClearToday = Int(UserDefaults.standard.double(forKey: "todayClear"))
    }
    
    mutating func removeLast() {
        let lastItem = cancelRecentItem()
        if lastItem.isClearWater {
            UserDefaults.standard.setValue(self.totalClearToday, forKey: "todayClear")
        }
        UserDefaults.standard.setValue(self.totalToday, forKey: "todayTotal")
    }
    
    mutating func addTotal(item: Int) {
        totalToday += item
    }
    
    mutating func addClear(item: Int) {
        totalClearToday += item
    }
    
    mutating func setTotal(item: Int) {
        totalToday = item
    }
    
    mutating func setClear(item: Int) {
        totalClearToday = item
    }
    
    mutating func getTotal() -> Int {
        return totalToday
    }
    
    mutating func getClear() -> Int {
        return totalClearToday
    }
}
