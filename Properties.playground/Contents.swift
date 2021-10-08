import Foundation
struct Loop {
    var radius = 0.0
    var diameter = 0.0
    
    var area: Double {
        get {
            if radius != 0 {
                let area1 = 3.14 * radius * radius
                return area1
            }
            else if diameter != 0 {
                let area1 = 3.14 * diameter * diameter / 4
                return area1
            }
            return 0
        }
        
        set(newArea) {
            radius = sqrt(newArea / 3.14)
            diameter = radius * 2
        }
    }
}

var loop = Loop()
loop.radius = 5.0
loop.area = 100.0
loop.radius
loop.diameter

struct Cube {
    var length = 0.0, height = 0.0, width = 0.0
    
    var volume: Double { // compute measurements through volume parameter
        didSet { // starts working every time volume value is changed
            length = pow(volume, 1/3)
            height = length
            width = length
        }
    }
}

var cube = Cube(volume: 167.0)
cube.volume = 249.0
cube.height
cube.width

class Account {
    var nickname: String {
        willSet(newNickname) {
            print("Your new nickname is \(newNickname)")
        }
        didSet {
            if nickname != oldValue {
                print("Your old nickname is \(oldValue)")
            }
        }
    }
    // willset and didset are implemented to access information about new and old values of parameters as soon as their values are changed
    var password: String {
        willSet(newPassword) {
            print("Your new password is \(newPassword)")
        }
        didSet {
            if password != oldValue {
                print("Your old password is \(oldValue)")
            }
        }
    }
    
    init(nickname: String, password: String) {
        self.nickname = nickname
        self.password = password
    }
}

var user = Account(nickname: "chubasha", password: "qwerty123456")
user.nickname = "darySP"
user.password = "8734gr8yfw9g"

@propertyWrapper//  attribute, which helps to wrap access to the property of the struct. When it is applied, wrapper struct name is used as a type name
struct setDay {
    private var day = 0
    
    var wrappedValue: Int {
        get { return day }
        set { day = min(newValue, 31) }
    }
}

@propertyWrapper
struct setMonth {
    private var month = 0
    
    var wrappedValue: Int {
        get { return month }
        set { month = min(newValue, 12) }
    }
}

@propertyWrapper
struct setYear {
    private var year = 0
    
    var wrappedValue: Int {
        get { return year }
        set { year = min(newValue, 2021) }
    }
}

struct SetDate { //attributes become custom types and provide protective functional(in this example we make sure our day, month and year variables belong to appropriate ranges)
    @setDay var day: Int
    @setMonth var month: Int
    @setYear var year: Int
}

var date  = SetDate()
date.day = 34
date.day

date.month = 34
date.month

date.year = 3400
date.year

@propertyWrapper
struct ManageDateComponents { // we can include additional parameters in order to make code reusable(provide variables for minimal and maximal values)
    private var initValue: Int
    private var maximum: Int
    private var minimal: Int
    
    var wrappedValue: Int { // property with name wrappedValue is obvious for class with propertyWrapper attribute
        get { return initValue }
        set {
            if initValue < minimal {
                initValue = minimal
            }
            else if initValue > maximum {
                initValue = maximum
            }
        }
    }
    
    init(maximum: Int, minimal: Int, value: Int) {
        self.maximum = maximum
        self.minimal = minimal
        self.initValue = min(value, maximum)
    }
}

struct DateComponents {
    @ManageDateComponents(maximum: 31, minimal: 1, value: 13) var day: Int
    @ManageDateComponents(maximum: 12, minimal: 1, value: 10) var month: Int
    @ManageDateComponents(maximum: 2021, minimal: 2002, value: 2005) var year: Int
}

var dateComponents = DateComponents()
print(dateComponents.day)
print(dateComponents.month)
print(dateComponents.year)

class AcademicClasses {
    static var amountOfClasses = 0 // static property is a common variable for all entities of the class
    var courseName: String
    
    init(courseName: String) {
        self.courseName = courseName
        AcademicClasses.amountOfClasses += 1 //called prefixed with class name
    }
}

var programming = AcademicClasses(courseName: "IOS development")
var economics = AcademicClasses(courseName: "Micro- macroeconomics")
AcademicClasses.amountOfClasses
var english = AcademicClasses(courseName: "Comprehension")
var uxDesign = AcademicClasses(courseName: "UI-UX design")
AcademicClasses.amountOfClasses
