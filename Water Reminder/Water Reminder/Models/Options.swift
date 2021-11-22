//
//  Options.swift
//  Water Reminder
//
//  Created by Darya on 11/9/21.
//

import Foundation

struct Option {
    let name: String
    let volume: Int
    let image: String
    let isClearWater: Bool
    
    public init(volume: Double) {
        self.name = ""
        self.image = ""
        self.isClearWater = true
        self.volume = Int(volume)
    }
    
    public init(name: String, volume: Int, image: String, isClearWater: Bool) {
        self.name = name
        self.volume = volume
        self.image = image
        self.isClearWater = isClearWater
    }
}
