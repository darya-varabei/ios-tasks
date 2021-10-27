import UIKit

enum CoffeeMachineError: Error { //define enumeration of error situations
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
    
    func prepare(item: Item) throws { //function responsible for preparing beverages. But in some cases it may be impossible due to lack of water or beans in coffee machine, or milk container absence
        guard item.beansNeededWeight <= self.beansWeight else { // guard statements enumerate situations  in which error throwing is requuired
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
        //if no errors were thrown preparation is handled
        self.beansWeight -= item.beansNeededWeight
        self.waterWeight -= item.waterNeededWeight
        self.milkWeight -= item.milkNeededWeight
        self.filterContaminationLevel += item.filterContaminationLevel
        self.thickLevel += item.thickProductionLevel
        print("\(item.name) is prepared successfully")
    }
    // methods for coffee machine support
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

func prepareCoffee(itemName: String, coffeeMachine: CoffeeMachine) throws {// throwable function which finds out if such item is provided
    
    try coffeeMachine.prepare(item: (items[itemName] ?? Item(name: "Capuccino", beansNeededWeight: 10, isMilkNeeded: true, milkNeededWeight: 150, waterNeededWeight: 50, thickProductionLevel: 1, filterContaminationLevel: 2)))
}
let coffeeMachine = CoffeeMachine(beansWeight: 100, waterWeight: 500, isMilkConnected: false, milkWeight: 20, thickLevel: 0, filterContaminationLevel: 0) // define coffee machine and its default state

coffeeMachine.connectMilkContainer()// connects milk container
coffeeMachine.fillUpWithmilk()
try prepareCoffee(itemName: "Latte", coffeeMachine: coffeeMachine)
try prepareCoffee(itemName: "Espresso", coffeeMachine: coffeeMachine)
try prepareCoffee(itemName: "Capuccino", coffeeMachine: coffeeMachine)
coffeeMachine.fillUpWithmilk()
try prepareCoffee(itemName: "Latte", coffeeMachine: coffeeMachine)
//methods are placed in configuration which allows to escape errors throwing


enum PasswordError: Error {
    case invalid
    case tooShort
    case noDecimals
}

class User {
    var username: String?
    var password: String?
    
    init(username: String?, password: String?) throws { // initializers also can be throwable. In this case password is being validated
        self.username = username
        guard let password = password else {
            throw PasswordError.invalid
        }
        guard password.count >= 15 else {
            throw PasswordError.tooShort
        }
        
        let decimals = CharacterSet.decimalDigits// checks if string contains digits
        let decimalRange = password.rangeOfCharacter(from: decimals)
        guard decimalRange != nil else {
            throw PasswordError.noDecimals
        }
        self.password = password
    }
}

// users definitions are wrapped into "do-catch satements" in order to produced errors would not prevent the code from further work, but printed out the definition of the error(default enumeration case string equals case name)
do {
    let _ = try User(username: "annyBunny", password: "eyrfb789euy97yh9898b")
} catch let error {
    print(error)
}

do {
    let _ = try User(username: "amNickolsen", password: "asdfghjkloiuyuthrgegfhy")
} catch let error {
    print(error)
}

do {
    let _ = try User(username: "samPeters", password: "1234fd")
} catch let error {
    print(error)
}
