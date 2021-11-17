//
//  Consumption.swift
//  Water Reminder
//
//  Created by Darya on 11/10/21.
//

import Foundation

class Consumption {
    let user = User.shared
    var recentItemsVolume: [Option] = []
    private var totalToday: Int = 0
    private var totalClearToday: Int = 0
    
    func addRecentItems(item: Option) {
        self.recentItemsVolume.append(item)
        self.totalToday += item.volume
        
        if item.isClearWater {
            self.totalClearToday += item.volume
        }
    }
    
    func cancelRecentItem() -> Option {
        if !self.recentItemsVolume.isEmpty {
            let lastItem = self.recentItemsVolume.last
            self.recentItemsVolume.removeLast()
            self.totalToday -= lastItem?.volume ?? 0
            
            if ((lastItem?.isClearWater) != nil) {
                self.totalClearToday -= lastItem?.volume ?? 0
            }
            return lastItem ?? Option(volume: 0)
            
        }
        else {
            return Option(volume: 0)
        }
    }
    
    func totalTodayPercent() -> Double {
        let total: Double = Double(self.totalToday)
        return total / user.recommendedDoze
    }
    
    func totalTodayClearPercent() -> Double {
        let total: Double = Double(self.totalClearToday)
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
    
    func fetchUserStoredData() {
        self.totalToday = Int(UserDefaults.standard.double(forKey: "todayTotal"))
        self.totalClearToday = Int(UserDefaults.standard.double(forKey: "todayClear"))
    }
    
    func removeLast() {
        let lastItem = self.cancelRecentItem()
        if lastItem.isClearWater {
            UserDefaults.standard.setValue(self.totalClearToday, forKey: "todayClear")
        }
        UserDefaults.standard.setValue(self.totalToday, forKey: "todayTotal")
    }
    
    func addTotal(item: Int) {
        self.totalToday += item
    }
    
    func addClear(item: Int) {
        self.totalClearToday += item
    }
    
    func setTotal(item: Int) {
        self.totalToday = item
    }
    
    func setClear(item: Int) {
        self.totalClearToday = item
    }
    
    func getTotal() -> Int {
        return self.totalToday
    }
    
    func getClear() -> Int {
        return self.totalClearToday
    }
}
