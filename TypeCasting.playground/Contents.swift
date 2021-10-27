import UIKit
//Enumerations for encapsulating possible ingredients for different beverages on different possitions
enum MilkshakeBase {
    case cream
    case icecream
    case veganIcecream
}

enum MilkshakeSpread {
    case syrop
    case jam
    case nutella
    case sweetCrumbs
}

enum Additional {
    case banana
    case strawberry
    case mango
    case chocolate
    case caramel
    case raspberry
}

enum Alcohol {
    case vodka
    case tequila
    case whiskey
    case rom
    case liquire
    case gin
    case vermuth
}

enum Tonning {
    case orangeJuice
    case syrop
    case appleJuice
    case sparklingWater
    case sweetSparklingWater
    case limeJuice
}

class Coctail {// superclass for different types of coctails
    let name: String
    var rating: Int
    
    init(name: String, rating: Int) {
        self.name = name
        self.rating = rating
    }
    
    func shake() {
        print("Shake-shake-shake")
    }
}

class Milkshake: Coctail { // subclass of Coctail
    let base: MilkshakeBase
    let spread: [MilkshakeSpread]
    let additional: [Additional]
    
    init(name: String, rating: Int, base: MilkshakeBase, spread: [MilkshakeSpread], additional: [Additional]) {
        self.base = base
        self.spread = spread
        self.additional = additional
        super.init(name: name, rating: rating) // inherits initialization of superclass
    }
    
    override func shake() {
        print("Shake with cream")
    }
}

class AlcoholBeverage: Coctail { // subclass of Coctail
    let content: [Alcohol]
    let tonning: [Tonning]
    
    init(name: String, rating: Int, content: [Alcohol], tonning: [Tonning]) {
        self.content = content
        self.tonning = tonning
        super.init(name: name, rating: rating) // inherits initialization of superclass
    }
    
    override func shake() {
        print("Shake with ice")
    }
}

let card: [Coctail] = [ //array of objects, which have common superclass, but are create as different subclasses
    Milkshake(name: "Chockomania", rating: 4, base: .icecream, spread: [.nutella, .sweetCrumbs], additional: [.banana]),
    AlcoholBeverage(name: "Mojito", rating: 5, content: [.rom], tonning: [.sparklingWater, .syrop]),
    Milkshake(name: "Fluffs", rating: 4, base: .cream, spread: [.syrop, .sweetCrumbs], additional: [.caramel, .strawberry]),
    AlcoholBeverage(name: "Daikiri", rating: 5, content: [.rom], tonning: [.limeJuice, .syrop]),
    AlcoholBeverage(name: "Manghatten", rating: 3, content: [.whiskey, .vermuth], tonning: [.appleJuice])
]

for item in card {
    if item is Milkshake { // define is items cast type is Milkshake
        print("Milkshake detected")
    }
    else {
        print("+18 only") // if it is not a milkshake, it means it is alcoholic
    }
}

for item in card {
    if let milkshake = item as? Milkshake { // optional downcast operator(using as! is not a good practice)
        print("\(milkshake.name) contains \(milkshake.base) and has a rating of \(milkshake.rating)")
    }
    
    if let beverage = item as? AlcoholBeverage {
        print("\(beverage.name) main ingredient is \(beverage.content[0]) and has a rating of \(beverage.rating)")
    }
}

for item in card {
    if let shake = item as? Milkshake { shake.shake() }// calls overriden methods as they are described in superclass
    else if let shake = item as? AlcoholBeverage { shake.shake() }
}

var randomItems: [Any] = [4.88, [1, 2, 3], "data", Milkshake(name: "Chockomania", rating: 4, base: .icecream, spread: [.nutella, .sweetCrumbs], additional: [.banana]), 2124554] // array contains many datatypes, which are basycally described as Any

for item in randomItems {// when w3e use Any or AnyObject we can skip using ? in as?
    
    switch item{
    case let decimalValue as Int:
        print("\(decimalValue + 5)")
    case let array as [Int]:
        print(array[1])
    case let data as String:
        print("Just string")
    case let coctail as Milkshake:
        print(coctail.additional[0])
    default:
        print("oops!")
    }
}
