//
//  Consumption.swift
//  Water Reminder
//
//  Created by Darya on 11/10/21.
//

import Foundation

class Consumption {
    let user = User.shared
    private var totalToday: Int = 0
    private var totalClearToday: Int = 0
    private var recentItemsVolume: [Option] = []
    
    func addRecentItems(item: Option) {
        self.recentItemsVolume.append(item)
        self.totalToday += item.volume
        
        if item.isClearWater {
            self.totalClearToday += item.volume
        }
    }
    
    func cancelRecentItem() {
        let lastItem = self.recentItemsVolume.last
        self.recentItemsVolume.removeLast()
        self.totalToday -= lastItem?.volume ?? 0
        
        if ((lastItem?.isClearWater) != nil) {
            self.totalClearToday -= lastItem?.volume ?? 0
        }
    }
    
    func totalTodayPercent() -> Double{
        let total: Double = Double(self.totalToday)
        return total/user.recommendedDoze
    }
    
    func totalTodayClearPercent() -> Double{
        let total: Double = Double(self.totalClearToday)
        return total/user.recommendedDoze
    }
}