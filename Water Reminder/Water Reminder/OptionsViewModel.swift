//
//  OptionsViewModel.swift
//  Water Reminder
//
//  Created by Darya on 11/9/21.
//

import Foundation

class OptionsViewModel {
    var quickOptions = [Option]()
    
    func fillOptions() {
        quickOptions.append(Option(name: "Small glass", volume: 100, image: "def", isClearWater: true))
        quickOptions.append(Option(name: "Medium glass", volume: 200, image: "def", isClearWater: true))
        quickOptions.append(Option(name: "Large glass", volume: 300, image: "def", isClearWater: true))
        quickOptions.append(Option(name: "0.75 bottle", volume: 750, image: "def", isClearWater: true))
        quickOptions.append(Option(name: "Small tea", volume: 200, image: "def", isClearWater: false))
        quickOptions.append(Option(name: "Large tea", volume: 300, image: "def", isClearWater: false))
        quickOptions.append(Option(name: "Small coffee", volume: 80, image: "def", isClearWater: false))
        quickOptions.append(Option(name: "Medium coffee", volume: 150, image: "def", isClearWater: false))
        quickOptions.append(Option(name: "Large coffee", volume: 250, image: "def", isClearWater: false))
        quickOptions.append(Option(name: "Small juice", volume: 150, image: "def", isClearWater: false))
        quickOptions.append(Option(name: "Large juice", volume: 300, image: "def", isClearWater: false))
    }
}
