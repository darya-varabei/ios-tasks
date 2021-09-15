import UIKit

class Developer{
    let name: String
    let skills: [String]
    let salaryPerMonth: [Double]
    let accessFloors: [Int]
    
    init(name: String, skills: [String], incomeForSixMonth salaryPerMonth: [Double], accessFloors: [Int]){
        self.name = name
        self.skills = skills
        self.salaryPerMonth = salaryPerMonth
        self.accessFloors = accessFloors
    }
}

func isPresent<T: Equatable>(item: T, inArray:[T]) -> Bool { //function with generic parameters. Provides functionality for objects of different types(constrained with Equatable protocol conformance in order to be able to apply "==" for them)
    var index: Int = 0
    
    while index < inArray.count {
        if item == inArray[index]{
            return true
        }
        else{
            index += 1
        }
    }
    return false
}

let developer1 = Developer(name: "Ann", skills: ["Github", "Swift", "Objective-C", "C++", "English"], incomeForSixMonth: [679.99, 576.498, 789.64, 785.56, 885.79, 897.63], accessFloors: [1, 3, 5, 7, 10])
let developer2 = Developer(name: "John", skills: ["BitBacket", "Swift", "Objective-C", "C", "Spanish"], incomeForSixMonth: [679.99, 576.498, 789.64, 785.56, 885.79, 897.63], accessFloors: [1, 2, 5, 9, 10])
let developer3 = Developer(name: "Willy", skills: ["Github", "Swift", "Objective-C", "C++", "English"], incomeForSixMonth: [679.99, 576.498, 789.64, 785.56, 885.79, 897.63], accessFloors: [1, 3, 5, 7, 10])

//the same function is used fror working with all fields of the class

isPresent(item: "Python", inArray: developer1.skills)
isPresent(item: "English", inArray: developer1.skills)
isPresent(item: 2, inArray: developer1.accessFloors)
isPresent(item: 7, inArray: developer1.accessFloors)
isPresent(item: 1000, inArray: developer1.salaryPerMonth)
isPresent(item: 576.498, inArray: developer1.salaryPerMonth)

//if we need to compare types which do not conform to Equatable protocol(ex: custom structs and classes) we may add extension manually

extension Developer: Equatable{ // if we intent to compare only skills and accessFloors
    static func == (lhs: Developer, rhs: Developer) -> Bool{
        if lhs.skills == rhs.skills && lhs.accessFloors == rhs.accessFloors{
            return true
        }
        else {return false}
    }
}

//now we can use "==" operand fro instances of Developer class(in our case we compare only skills and accessFloors)
if developer1 == developer2{
    print("1 and 2 are equal")
} else {
    print("1 and 2 are not equal")
}

if developer1 == developer3{
    print("1 and 3 are equal")
} else {
    print("1 and 3 are not equal")
}

protocol Training{ //protocol for training programs
    var program: String { get }
    func computeTrainingDuration() -> Int
}

class TrainieDeveloper: Developer, Training{// conforms to Training protocol and inherited from Developer superclass
    
    let program: String
    
    init(name: String, skills: [String], salaryPerMonth: [Double], accessFloors: [Int], program: String){
        self.program = program
        super.init(name: name, skills: skills, incomeForSixMonth: salaryPerMonth, accessFloors: accessFloors)// inherits part of initialization from superclass
    }
    
    func computeTrainingDuration() -> Int{
        
        var expectedDuration = 2
        if !isPresent(item: "English", inArray: self.skills){
            expectedDuration += 1
        }
        if self.skills.count <= 3{
            expectedDuration += 2
        }
        if !isPresent(item: "Github", inArray: self.skills){
            expectedDuration += 3
        }
        return expectedDuration
    }
}


// MARK: Associated types

protocol FormArray{
    associatedtype Item// associated type means that we can make use any type, trying to conform protocol stubs
    var count: Int { get }
    mutating func form(_ item: Item)
}

struct myArray<Element>: FormArray { // elements of different types can form array
    var items: [Element] = []
    
    mutating func form(_ item: Element) {
        items.append(item)
    }
    
    var count: Int{
        return items.count
    }
}

let intArray = myArray<Int>(items: [1, 4, 7, 9, 12, 24, 878])
let stringArray = myArray<String>(items: ["swift", "python", "java", "ruby", "c++"])
let doubleArray = myArray<Double>(items: [1.865, 4.58678, 7.8476, 9.953, 12.74, 24.3456, 878.768567])
let anyArray = myArray<Any>(items: [1, "objective-c", 7.37687, ["c++", "c#"], 12, [24, 23, 44], 878])//array may contain different types at the same time

//implemented methods work for arrays with different types
anyArray.count
stringArray.count
