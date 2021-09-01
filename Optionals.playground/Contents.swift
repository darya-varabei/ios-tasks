import UIKit

// MARK: Optional chaining

class Beverage {
    var sweetener: Sweetener?// property defined as an optional type
}

class Sweetener {
    var numOfSpoons = 1
}

let coffee = Beverage()// class initialization takes no parametres, Sweetener is optional and has a nil reference

///let sweeteness = coffee.sweetener!.numOfSpoons// error: coffee.sweetener is an empty reference. Unwrapping it causes crash
// MARK: Solution 1

if let sweeteness = coffee.sweetener?.numOfSpoons{ // we try to unwrap an optional value, and if it is successed we get the value.Otherwise we move to else statement
    print("Coffee has \(sweeteness) spoons of sugar")
}
else {
    print("Coffee sweetness is unknown") // else statement works, as coffee.sweetener is still nil
}

// MARK: Solution 2

coffee.sweetener = Sweetener()// initializer takes no arguments, but it contains a default value
coffee.sweetener?.numOfSpoons = 3

if let sweeteness = coffee.sweetener?.numOfSpoons{ // we try to unwrap an optional value, and if it is successed we get the value. Otherwise we move to else statement
    print("Coffee has \(sweeteness) spoons of sugar") // coffee.sweetener now has a value
}
else {
    print("Coffee sweetness is unknown")
}

// Model classes for optional chaining

class Cookbook{
    var dish: Recipe?
}

class Recipe{
    var name: String
    var ingredients: [Ingredient]
    
    init(name: String, ingredients: [Ingredient]){
        self.name = name
        self.ingredients = ingredients
    }
    
    var numOfIngredients: Int {
        return ingredients.count
    }
    
    subscript(i: Int) -> Ingredient { // to access ingredients in array with indexes
        get{
            return ingredients[i]
        }
        set {
            ingredients[i] = newValue
            
        }
    }
    
    func compTotalCost() -> Double{
        var totalCost = 0.0
        
        for i in 0..<ingredients.count{
            totalCost += ingredients[i].cost ?? 0
        }
        return totalCost
    }
}

class Ingredient{
    let name: String?
    let cost: Double?
    
    init(name: String, cost: Double){
        self.name = name
        self.cost = cost
    }
}

let cookbook = Cookbook()

let ingredient = Ingredient(name: "Parmezan", cost: 12.78)
cookbook.dish?.ingredients.append(ingredient) // can not be appended
print("Total cost is \(String(describing: cookbook.dish?.compTotalCost()))") //result is nil, as we have no reference from Cookbook to Recipe
if cookbook.dish?.compTotalCost() != nil {
    print("Total cost is computed successfully")
}
else {
    print("We can not compute total cost")// else statement works. Still no reference to Recipe from Cookbook
}

let recipe = Recipe(name: "Lasagna", ingredients: [ingredient]) //create recipe entity and define its properties(not obvious, as they are optional)
cookbook.dish = recipe //pass reference from Cookbook to Recipe

if cookbook.dish?.compTotalCost() != nil {
    print("Total cost is computed successfully") // reference is passed and all arguments are taken, so that method was successfully used
}
else {
    print("We can not compute total cost")
}

// Accessing subscripts of optional type

var marks = ["Julie": [9, 7, 9, 5], "Mark": [5, 10, 7, 7]]
marks["Julie"]?[3] = 10
marks["Mark"]?[2] += 1
marks["Mary"]?[1] += 5//Mary does not exist in array, but as she is repredented as an optional, crash does not occur


