import UIKit

class Ingredient {
    let protein: Double
    let fat: Double
    let carbohydrate: Double

    init(protein: Double, fat: Double, carbohydrate: Double) {
        self.protein = protein
        self.fat = fat
        self.carbohydrate = carbohydrate
    }
    
    deinit {
       print("Ingredient deinit")
    }
}

class Dish {
    private var energy: Double = 0 // variable is marlked as private, so that it can not be accessed outside class definition
    fileprivate var ingredients: [Ingredient] = [] // fileprivate variable can not be accessed uotside source file
    lazy var percentFromDailyNorm: Double = { // variables marked lazy are not computed before they are accessed
        return energy/20
    }()
    
    public func increaseEnergy(adding ingredient: Ingredient) {
        let proteinEnergy = ingredient.protein * 4
        let fatEnergy = ingredient.fat * 9
        let carbEnergy = ingredient.carbohydrate * 4
        energy += proteinEnergy + fatEnergy + carbEnergy
        ingredients.append(ingredient)
    }
    
    deinit {
        print("Dish deinit")
    }
}

func show() {
    let carrot = Ingredient(protein: 2, fat: 0.8, carbohydrate: 6.7)
    let potato = Ingredient(protein: 3, fat: 1, carbohydrate: 12.5)
    let ham = Ingredient(protein: 6.8, fat: 9.8, carbohydrate: 17)
    
    let dish = Dish()
//    dish.energy // can not be accessed outside class
    dish.increaseEnergy(adding: carrot) //energy changes through accessing public function, which modifies variable inside class
    dish.increaseEnergy(adding: potato)
    dish.increaseEnergy(adding: ham)
    dish.percentFromDailyNorm
}

show()

fileprivate extension Ingredient { // extension can be defined as fileprivate to provide additional functionality for class inside sourcefile
    func countEnergy() -> Double{
        var energy = 0.0
        let proteinEnergy = protein * 4
        let fatEnergy = fat * 9
        let carbEnergy = carbohydrate * 4
        energy += proteinEnergy + fatEnergy + carbEnergy
        return energy
    }
}

let yoghurt = Ingredient(protein: 2, fat: 0.8, carbohydrate: 6.7)
yoghurt.countEnergy()
let cheese = Ingredient(protein: 17.3, fat: 14.8, carbohydrate: 2.1)
cheese.countEnergy()

class Game {
    private var distance: Double = 0.0 // private variable, which can not be accessed outside class and modified through didSet for step variable
    var step = 0 {
        didSet {
            distance += 0.8
        }
    }
    
    func showDistance() {
        print("The distance is \(distance)")
    }
}
let game = Game()
game.step = 1 // every change modifies distance variable
game.step = 2
game.step = 3
game.step = 4
game.showDistance()


class Accounts {
    private enum PersonalAccount { //private enum is used only inside class definition
        case credit(amount: Int64, id: UInt)
        case debit(amount: UInt64, id: UInt)
    }
    private let accounts: [PersonalAccount] = [.credit(amount: -1000, id: 1),// accounts also can not be modified outside class
                                       .debit(amount: 1000, id:2),
                                       .credit(amount: -1000000, id: 3)]
    //MARK: Both functions provide access to accounts variable in two ways
    func credit(){
        for account in accounts {
            if case let .credit(amount, id) = account {
                print("amount: \(amount) id: \(id)")
            }
        }
    }
    
    func pattern(){
        for case let .credit(amount, id) in accounts {
            print("amount: \(amount) id: \(id)")
        }
    }
}

let accounts = Accounts()
accounts.credit()
accounts.pattern()

// MARK: One more example using 'where' keyword
let views: [UIView] = [UIButton(), UILabel(), UIScrollView(), UILabel()]

for view in views where view is UILabel {
    print("view class: \(view.self)")
}

// MARK: Class is defined as open in other source file(MyFramework.swift)
let newCart = Cart()
newCart.newPurchase(name: "Mac Pro", price: 2999)
newCart.newPurchase(name: "Go Pro", price: 899)
let totalPrice = newCart.calculatePrice()
newCart.products[0].name
newCart.products[0].purchasePrice
let newPrice = newCart.calculatePrice()

class Discount: Cart { // Cart is marked as open, which means it can be subclassed from another module
    var age: Int
    var discountPercentage: Double {
        age > 55 ? 10 : 0
    }
    
    init(age: Int) {
        self.age = age
        super.init()
    }
    
    override func calculatePrice() -> Double { // to be able to override function in other source file, this function must be defined as open in super class
        super.calculatePrice() * (1 - discountPercentage / 100)
    }
}

let oneMoreCart = Discount(age: 58)
oneMoreCart.newPurchase(name: "Airpods 4", price: 499)
oneMoreCart.newPurchase(name: "iPhone X", price: 1299)
let totalCost = oneMoreCart.calculatePrice()
