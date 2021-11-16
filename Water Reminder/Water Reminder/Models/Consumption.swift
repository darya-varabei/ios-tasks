//
//  Consumption.swift
//  Water Reminder
//
//  Created by Darya on 11/10/21.
//

import Foundation

class Consumption {
    let user = User.shared
    var totalToday: Int = 0
    var recentItemsVolume: [Option] = []
    private var totalClearToday: Int = 0
    
    func addRecentItems(item: Option) {
        self.recentItemsVolume.append(item)
        self.totalToday += item.volume
        
        if item.isClearWater {
            self.totalClearToday += item.volume
        }
    }
    
    func cancelRecentItem() -> Int {
        if !self.recentItemsVolume.isEmpty{
            let lastItem = self.recentItemsVolume.last
            self.recentItemsVolume.removeLast()
            self.totalToday -= lastItem?.volume ?? 0
            
            if ((lastItem?.isClearWater) != nil) {
                self.totalClearToday -= lastItem?.volume ?? 0
            }
            return lastItem?.volume ?? 0
            
        }
        else {
            return 0
        }
    }
    
    func totalTodayPercent() -> Double {
        let total: Double = Double(self.totalToday)
        return total/user.recommendedDoze
    }
    
    func totalTodayClearPercent() -> Double {
        let total: Double = Double(self.totalClearToday)
        return total/user.recommendedDoze
    }
    
    func initUser() {
        user.weight = UserDefaults.standard.double(forKey: "bodyweight")
        user.averageSportDurationADay = UserDefaults.standard.double(forKey: "activity")
        user.recommendedDoze = UserDefaults.standard.double(forKey: "doze")
    }
}
