import UIKit

// MARK: Breaking reference cycle with weak property

class Choir {
    let name: String
    var conductor: Person?
    
    init(name: String){
        self.name = name
        print("\(name) is initialized")
    }
    
    deinit{
        print("\(name) is deinitialized")
    }
}

class Person {
    let name: String
    weak var choir: Choir?//property is initialized as weak, as Persons lifespan is not shorter than the one of Choir, so that it can be turned to nil. Referece cycle does not occur as weak properties do not incerease the reference couter of the object
    
    init(name: String){
        self.name = name
        print("\(name) is initialized")
    }
    
    deinit{
        print("\(name) is deinitialized")
    }
}

func initialization(){
    let mary = Person(name: "Mary Thompson")
    let choir = Choir(name: "Glows")
mary.choir = choir //set reference from choir to person and from person to choir
choir.conductor = mary
}

initialization()//after leaving scope (when function finishes working) objects get deallocated, as they do not hold strong references to each other

// MARK: Breaking reference cycle with unowned property

class Student{
    let name: String
    var task: Task?
    
    init(name: String){//, task: Task){
        self.name = name
        //self.task = task
        print("Student is initialized")
    }
    
    deinit{
        print("Student is deinitialized")
    }
}

class Task{
    let name: String
    unowned let student: Student // student lifespan is longer or equal to Task lifespan. So it should be defined as unowned, as it will never turn nil
    
    init(name: String, student: Student){
        self.name = name
        self.student = student
        print("Task is initialized")
    }
    
    deinit{
        print("Task is deinitialized")
    }
}


func initialize() {
    let mary = Student(name: "Mary Thompson")
    let task = Task(name: "Glows", student: mary)//initialize objects and set reference from Task to Student
mary.task = task //set reference from student to task
}

initialize()//after leaving scope local objects get deallocated, as unowned reference does not increase reference counter

// MARK: Breaking reference cycle with unowned optional property

class Meal{
    let name: String
    unowned var nextMeal: Meal?//properties defined as unowned optionals, as objects they refer to do not live longer than the class itself, but should be capable to set reference to nil as a part of business logic
    unowned var previousMeal: Meal?
    
    init(name: String){
        self.name = name
        self.nextMeal = nil// set to nil as default and not included into the constructor
        self.previousMeal = nil
        print("\(name) is initialized")
    }
    
    deinit{
        print("\(name) is deinitialized")
    }
}


var breakfast: Meal?//allocating objects in memory
var lunch: Meal?
var dinner: Meal?

breakfast = Meal(name: "Porridge")//initialize class instances
lunch = Meal(name: "Pizza")
dinner = Meal(name: "Salad")
breakfast!.nextMeal = lunch//set references to properties, which are also entities of the class Meal
lunch!.previousMeal = breakfast
lunch!.nextMeal = dinner// some of the properties stay nil(just not overwriten, aas they are nil by default)
dinner!.previousMeal = lunch
breakfast = nil//free up objects, which hold unowned references on each other
lunch = nil
dinner = nil//aftre setting references to nil objects get deallocated as they do not hold string references to each other and their reference counters are zero

// MARK: Retain cycle created by closure

class BirthDate{
    let day: Int
    let month: Int
    let year: Int
    lazy var fullDate: () -> String = { [unowned self] in//without defining capture list the closure referes to its class and class holds the closure(as soon as it is announced)
        return "\(day).\(month).\(year)"//capture list defines the rules of properties behaviour inside the closure cd Documents
    }
    
    init(day: Int, month: Int, year: Int){
        self.day = day
        self.month = month
        self.year = year
        print("Birthdate is initialized")
    }
    
    deinit{
        print("Birthdate is deinitialized")
    }
}

var birthDate: BirthDate? = BirthDate(day: 14, month: 7, year: 2002)
let fulldate = birthDate!.fullDate
birthDate = nil

