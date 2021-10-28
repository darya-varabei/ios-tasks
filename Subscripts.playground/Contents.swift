let matrix = [ // if we form a multidimensional array, we can access its elements through built-in subscripts
[0,2,5,6,7],
    [2,5,2,6,9],
    [3,5,1,9,6],
    [8,4,5,3,7],
    [3,6,4,8,2]
]

matrix[3][4]

let country = [// if we get data, which has quite a complex structure (similar to JSON format), some elements of the struct can act as subscripts to other components
    "Italy": [
        "data": [//ex: the value of area can be accessed with a chain Italy->data->area(all elements of chain are subscripts)
            "area": "301.23",
                "population": "59.55",
            "language": ["1": "Italian"],
            "flagColors": ["1": "Red", "2": "White", "3": "Green"]
        ],
        "nationalDishes": ["1": "Pizza", "2": "Pasta", "3": "Pita"]
    ],
    
    "Sweden": [
        "data": [
            "area": "450.29",
            "population": "10.402",
            "language": ["1": "Swedish", "2": "Finish"],
            "flagColors": ["1": "Blue", "2": "Yellow"]
        ],
        "nationalDishes": ["1": "Meatballs", "2": "Lingonberry Jam", "3": "Pyttipanna"]
    ]
]

let italian = country["Italy"]?["data"]?["area"]
let swedish = country["Sweden"]?["data"]?["language"]

class Days {
    private var days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    subscript(index: Int) -> String { // as we create custom classes, they have no default subscripts, so we need to create custom ones
        get { //if subscripts contain get and set statements, subscribed properties turn to be both readable and writable
            return days[index]
        }
        set(newValue) {
            self.days[index] = newValue
        }
    }
}

var week = Days()

week[3] //property days is private, but its elements are accessed through subscripts
week[5]
week[6]

class MealPlan {
    
    enum Meal {
        case breakfast
        case lunch
        case snack
        case dinner
        case supper
    }
    
    var meals: [Meal: String] = [:]
    
    subscript(index: Meal) -> String {
        get {
            if let currentMeal = meals[index] { // cases of enum act as subscripts for dishes in different meals
                return currentMeal
            } else {
                return "Oatmeal"
            }
        }
        
        set(newName) {
            meals[index] = newName // we can set dishes for meals outside class
        }
    }
}

let today = MealPlan()
today[.dinner] = "Salad"
today[.snack] = "Banana"
today[.supper] = "Yoghurt"

class Classroom {
    var zero: String?
    var undefined: String?
    subscript(floor: Int, number: Int) -> String {
        get {
            if floor == 0 || number == 0 {
                return zero ?? "0" //floor and classroom number can't be zero
            }
            else {
                return undefined ?? "Not defined" // if classroom with subscript values are still not defined
            }
        }
        set(newValue) { // writable property
            if floor == 0 {
                if number == 0 {
                    zero = newValue
                }
                else {
                    undefined = newValue
                }
            }
        }
    }
}

var laboratory = Classroom()
laboratory[1,3] = "IT-laboratory"
laboratory[2,2] = "Chemical laboratory"
laboratory[8,4]

let input = "Swift Tutorials"//basically strings are not provided with functional for iterating through characters using subscripts, but it can be done through extensions

extension String {
    subscript(i: Int) -> Character? {
        if self.count < i {
            return self[index(startIndex, offsetBy: i)]
        }
        else { return nil }
    }
}

let char = input[3]

class Book {
     
    var name: String
    init(name: String) {
         
        self.name = name
    }
}

class Bookshelf {
     
    var books: [Book] = [Book]()
     
    init() {
         
        books.append(Book(name: "The fault in our stars"))
        books.append(Book(name: "Carry"))
        books.append(Book(name: "Green mile"))
    }
     
    subscript(index: Int) -> Book {
         
        return books[index]
    }
}

var myCollection: Bookshelf = Bookshelf()
var firstBook: Book = myCollection[0]
print(firstBook.name)
print(myCollection[2].name)
