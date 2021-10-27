import UIKit

enum CoffeeMachineError: Error {
    case outOfBeans
    case outOfWater
    case outOfMilk
    case noMilkContainerConnnected
    case cleanUpThick
    case replaceFilter
    case unknownErrror
}

struct Item {
    let name: String
    let beansNeededWeight: Int
    let isMilkNeeded: Bool
    let milkNeededWeight: Int
    let waterNeededWeight: Int
    let thickProductionLevel: Int
    let filterContaminationLevel: Int
}

class CoffeeMachine {
    private var beansWeight: Int
    private var waterWeight: Int
    private var isMilkConnected: Bool
    private var milkWeight: Int
    private var thickLevel: Int
    private var filterContaminationLevel: Int
    
    init(beansWeight: Int, waterWeight: Int, isMilkConnected: Bool, milkWeight: Int, thickLevel: Int, filterContaminationLevel: Int) {
        self.beansWeight = beansWeight
        self.waterWeight = waterWeight
        self.isMilkConnected = isMilkConnected
        self.milkWeight = milkWeight
        self.thickLevel = thickLevel
        self.filterContaminationLevel = filterContaminationLevel
    }
    
    func prepare(item: Item) throws {
        guard item.beansNeededWeight <= self.beansWeight else {
            throw CoffeeMachineError.outOfBeans
        }
        
        guard item.waterNeededWeight <= self.waterWeight else {
            throw CoffeeMachineError.outOfWater
        }
        
        guard (item.isMilkNeeded && self.isMilkConnected) || !item.isMilkNeeded else {
            throw CoffeeMachineError.noMilkContainerConnnected
        }
        
        guard item.milkNeededWeight <= self.milkWeight else {
            throw CoffeeMachineError.outOfMilk
        }
        
        guard self.filterContaminationLevel < 30 else {
            throw CoffeeMachineError.replaceFilter
        }
        
        guard self.thickLevel < 20 else {
            throw CoffeeMachineError.cleanUpThick
        }
        
        self.beansWeight -= item.beansNeededWeight
        self.waterWeight -= item.waterNeededWeight
        self.milkWeight -= item.milkNeededWeight
        self.filterContaminationLevel += item.filterContaminationLevel
        self.thickLevel = item.thickProductionLevel
        print("\(item.name) is prepared successfully")
    }
    
    func connectMilkContainer() {
        if !self.isMilkConnected {
            self.isMilkConnected = true
            print("Container connected successfully")
        }
        
        else { print("Container is already connected") }
    }
    
    func disconnectMilkContainer() {
        if self.isMilkConnected {
            self.isMilkConnected = false
            print("Container disconnected successfully")
        }
        
        else { print("Container is already disconnected") }
    }
    
    func fillUpWithBeans() {
        if self.beansWeight < 30 {
            self.beansWeight += 150
        }
        else { print("Bean container is full!") }
    }
    
    func fillUpWithmilk() {
        if self.milkWeight < 200 {
            self.milkWeight += 500
        }
        else { print("Milk container is full!") }
    }
    
    func fillUpWithWater() {
        if self.waterWeight < 300 {
            self.waterWeight += 1500
        }
        else { print("Water container is full!") }
    }
    
    func cleanUpThick() {
        self.thickLevel = 0
    }
    
    func replaceFilter() {
        self.filterContaminationLevel = 0
    }
}

var items = [
    "Espresso": Item(name: "Espresso", beansNeededWeight: 10, isMilkNeeded: false, milkNeededWeight: 0, waterNeededWeight: 50, thickProductionLevel: 1, filterContaminationLevel: 1),
    "Americano": Item(name: "Americano", beansNeededWeight: 20, isMilkNeeded: false, milkNeededWeight: 0, waterNeededWeight: 150, thickProductionLevel: 2, filterContaminationLevel: 2),
    "Capuccino": Item(name: "Capuccino", beansNeededWeight: 10, isMilkNeeded: true, milkNeededWeight: 150, waterNeededWeight: 50, thickProductionLevel: 1, filterContaminationLevel: 2),
    "Latte": Item(name: "Latte", beansNeededWeight: 10, isMilkNeeded: true, milkNeededWeight: 200, waterNeededWeight: 40, thickProductionLevel: 1, filterContaminationLevel: 1),
    "Lungo": Item(name: "Lungo", beansNeededWeight: 30, isMilkNeeded: false, milkNeededWeight: 0, waterNeededWeight: 200, thickProductionLevel: 3, filterContaminationLevel: 3)
]

func prepareCoffee(itemName: String, coffeeMachine: CoffeeMachine) throws {
    
    try coffeeMachine.prepare(item: (items[itemName] ?? Item(name: "Capuccino", beansNeededWeight: 10, isMilkNeeded: true, milkNeededWeight: 150, waterNeededWeight: 50, thickProductionLevel: 1, filterContaminationLevel: 2)))
}
let coffeeMachine = CoffeeMachine(beansWeight: 100, waterWeight: 500, isMilkConnected: false, milkWeight: 20, thickLevel: 0, filterContaminationLevel: 0)

coffeeMachine.connectMilkContainer()
coffeeMachine.fillUpWithmilk()
try prepareCoffee(itemName: "Latte", coffeeMachine: coffeeMachine)
try prepareCoffee(itemName: "Espresso", coffeeMachine: coffeeMachine)
try prepareCoffee(itemName: "Capuccino", coffeeMachine: coffeeMachine)
coffeeMachine.fillUpWithmilk()
try prepareCoffee(itemName: "Latte", coffeeMachine: coffeeMachine)
