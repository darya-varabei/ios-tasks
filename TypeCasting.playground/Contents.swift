import UIKit

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

class Coctail {
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

class Milkshake: Coctail {
    let base: MilkshakeBase
    let spread: [MilkshakeSpread]
    let additional: [Additional]
    
    init(name: String, rating: Int, base: MilkshakeBase, spread: [MilkshakeSpread], additional: [Additional]) {
        self.base = base
        self.spread = spread
        self.additional = additional
        super.init(name: name, rating: rating)
    }
    
    override func shake() {
        print("Shake with cream")
    }
}

class AlcoholBeverage: Coctail {
    let content: [Alcohol]
    let tonning: [Tonning]
    
    init(name: String, rating: Int, content: [Alcohol], tonning: [Tonning]) {
        self.content = content
        self.tonning = tonning
        super.init(name: name, rating: rating)
    }
    
    override func shake() {
        print("Shake with ice")
    }
}

let card: [Coctail] = [
    Milkshake(name: "Chockomania", rating: 4, base: .icecream, spread: [.nutella, .sweetCrumbs], additional: [.banana]),
    AlcoholBeverage(name: "Mojito", rating: 5, content: [.rom], tonning: [.sparklingWater, .syrop]),
    Milkshake(name: "Fluffs", rating: 4, base: .cream, spread: [.syrop, .sweetCrumbs], additional: [.caramel, .strawberry]),
    AlcoholBeverage(name: "Daikiri", rating: 5, content: [.rom], tonning: [.limeJuice, .syrop]),
    AlcoholBeverage(name: "Manghatten", rating: 3, content: [.whiskey, .vermuth], tonning: [.appleJuice])
]

for item in card {
    if item is Milkshake {
        print("Milkshake detected")
    }
    else {
        print("+18 only")
    }
}

for item in card {
    if let milkshake = item as? Milkshake {
        print("\(milkshake.name) contains \(milkshake.base) and has a rating of \(milkshake.rating)")
    }
    
    if let beverage = item as? AlcoholBeverage {
        print("\(beverage.name) main ingredient is \(beverage.content[0]) and has a rating of \(beverage.rating)")
    }
}

for item in card {
    if let shake = item as? Milkshake { shake.shake() }
    else if let shake = item as? AlcoholBeverage { shake.shake() }
}

var randomItems: [Any] = [4.88, [1, 2, 3], "data", Milkshake(name: "Chockomania", rating: 4, base: .icecream, spread: [.nutella, .sweetCrumbs], additional: [.banana]), 2124554]

for item in randomItems {
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
