import Foundation
import UIKit

enum TrafficLight {
    case red, yellow, green
    
    mutating func changeColor() {
        switch self {
        case .red:
            self = .yellow
        case .yellow:
            self = .green
        case .green:
            self = .red
        }
    }
}

struct Employee {
    var salary = 0
    
    mutating func increaseSalary(increment: Int) {
        salary = salary + increment
    }
}

var accountant = Employee()
accountant.salary = 3000
accountant.increaseSalary(increment: 500)
accountant.salary

var trafficLight = TrafficLight.red
trafficLight.changeColor()

@dynamicCallable
struct Rows {
    func dynamicallyCall(withKeywordArguments pairs: KeyValuePairs<String, Int>) -> String {
        return pairs.map { label, count in
            repeatElement(label, count: count).joined(separator: " ")
        } .joined(separator: "\n")
    }
}

let showRows = Rows()
print(showRows(c: 7, d: 6, e: 5, f: 4, g: 3, h: 2, i: 1))

class Students {
    static var value = 0
    
    static func increment() {
        value += 1;
        print(value)
    }
}

var stud = Students()
var stud1 = Students()
var stud2 = Students()
Students.increment()
Students.increment()
print(Students.value)

class ReferenceMath {
    class func sqrt(of value: Int) -> Int {
        if value >= 0 {
            return value * value
        } else {
            return value
        }
    }
}

struct ValueMath {
    static func sqrt(of value: Int) -> Int {
        if value >= 0 {
            return value * value
        } else {
            return value
        }
    }
}

let referenceTypeAnswer = ReferenceMath.sqrt(of: -5)
let valueTypeAnswer = ValueMath.sqrt(of: -5)
print(referenceTypeAnswer)
print(valueTypeAnswer)
