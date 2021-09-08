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

if let sweeteness = coffee.sweetener?.numOfSpoons { // we try to unwrap an optional value, and if it is successed we get the value.Otherwise we move to else statement
    print("Coffee has \(sweeteness) spoons of sugar")
}
else {
    print("Coffee sweetness is unknown") // else statement works, as coffee.sweetener is still nil
}

// MARK: Solution 2

coffee.sweetener = Sweetener()// initializer takes no arguments, but it contains a default value
coffee.sweetener?.numOfSpoons = 3

if let sweeteness = coffee.sweetener?.numOfSpoons { // we try to unwrap an optional value, and if it is successed we get the value. Otherwise we move to else statement
    print("Coffee has \(sweeteness) spoons of sugar") // coffee.sweetener now has a value
}
else {
    print("Coffee sweetness is unknown")
}

// Model classes for optional chaining
class Cookbook {
    var dish: Recipe?
}

class Recipe {
    var name: String
    var ingredients: [Ingredient]
    
    init(name: String, ingredients: [Ingredient]) {
        self.name = name
        self.ingredients = ingredients
    }
    
    var numOfIngredients: Int {
        return ingredients.count
    }
    
    subscript(i: Int) -> Ingredient { // to access ingredients in array with indexes
        get {
            return ingredients[i]
        }
        set {
            ingredients[i] = newValue
        }
    }
    
    func compTotalCost() -> Double {
        var totalCost = 0.0
        
        for i in 0..<ingredients.count {
            totalCost += ingredients[i].cost ?? 0
        }
        return totalCost
    }
}

class Ingredient {
    let name: String?
    let cost: Double?
    
    init(name: String, cost: Double) {
        self.name = name
        self.cost = cost
    }
}

let cookbook = Cookbook()

let ingredient = Ingredient(name: "Parmezan", cost: 12.78)
cookbook.dish?.ingredients.append(ingredient) // can not be appended, as cookbook has no reference to dish
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
marks["Mary"]?[1] += 5//Mary does not exist in array, but as she is represented as an optional, crash does not occur

//MARK: Nil-coalesing operator

let loveLettersSenders = ["Bob", "Alex", "Elliot", nil, nil, "Fred", nil]

/*for sender in loveLettersSenders {
    print("Sender is \(sender!)")//error occurs when trying to implicitly unwrap all values in array
}*/

//Unconditional unwrapping is not recommended to use, as if the unwrapped value turned out to be nil, runtime error occurs and program crashes. It can be used only when we are absolutely sure the optional value is not nil

// Solution
for sender in loveLettersSenders {
    print("Sender is \(sender ?? "Anonymous")")// if sender turns out to be nil, default value after ?? is used
}

// Solution 2: Optional binding
for sender in loveLettersSenders {
    
    if let name = sender { //if name gets value -> sender is not nil
        print("Sender is \(name)")
    }
    else{
        print("Sender is Anonymous")
    }
}
// or using "guard"
for sender in loveLettersSenders {
    guard let name = sender else {
        continue
    }
    print(name)
}

let earthquakesPerCountry = [1, 4, nil, 2, nil, 0, 2, 1, nil, 5, 7, 3, 4]
// Solution 3
for count in earthquakesPerCountry { //as optional is basically a representation of enum, it works with switch-case operator
    switch count {
    case .some(0):  // value is presented and specifie in statement
        print("No earthquakes in this country")
        break
    case .some:  // value is presented
        print("Data is available")
    case .none: //nil
        print("Data is not available")
    }
}




