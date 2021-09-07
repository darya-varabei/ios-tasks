import UIKit

//MARK: Arrays
// stores objects of the same type in ordered list and equiped with indexes to access them

var playList = ["Rammstein", "Bring me the horizon", "Three Days Grace", "Black Veil Brides", "Powerwolf"]
var newSingers = ["Hollywoood undead", "Evanescence", "Within Temptation"]

playList.isEmpty // if no items in array return true
playList.count //number of items in array
playList.first //first element
playList.append("Maneskin") //adds element to the end of the array
playList[4]
playList.remove(at: 2)
playList[1...3]
playList.replaceSubrange(0...2, with: newSingers) //replaces elements in range with other array elements
playList.contains("Rammstein")
playList.min()
playList.shuffle() // place elements in random order

for singer in playList {
    print("I love \(singer)")
}

for (index, value) in playList.enumerated() { //iterates objects and indexes
    print("Singer \(index + 1): \(value)")
}

let cells = [Bool](repeating: false, count: 10)

class Student: Hashable {
    let fullName: String
    let mathMark: Int
    let programmingMark: Int
    let englishMark: Int
    let spanishMark: Int
    let academicYear: Int
    
    init(fullName: String, mathMark: Int, programmingMark: Int, englishMark: Int, spanishMark: Int, academicYear: Int) {
        self.fullName = fullName
        self.mathMark = mathMark
        self.programmingMark = programmingMark
        self.englishMark = englishMark
        self.spanishMark = spanishMark
        self.academicYear = academicYear
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(fullName)
    }
}

let mary = Student(fullName: "Mary Green", mathMark: 7, programmingMark: 9, englishMark: 5, spanishMark: 9, academicYear: 2)
let sam = Student(fullName: "Sam Jackson", mathMark: 6, programmingMark: 7, englishMark: 10, spanishMark: 8, academicYear: 3)
let polly = Student(fullName: "Polly Cowls", mathMark: 9, programmingMark: 10, englishMark: 10, spanishMark: 6, academicYear: 4)
let terry = Student(fullName: "Terry Paul", mathMark: 6, programmingMark: 8, englishMark: 8, spanishMark: 8, academicYear: 2)
let alice = Student(fullName: "Alice Bronx", mathMark: 9, programmingMark: 10, englishMark: 4, spanishMark: 4, academicYear: 4)
let john = Student(fullName: "John Ohlsen", mathMark: 5, programmingMark: 9, englishMark: 8, spanishMark: 5, academicYear: 1)
let darnel = Student(fullName: "Darnel Ross", mathMark: 10, programmingMark: 2, englishMark: 4, spanishMark: 6, academicYear: 2)

var students = [mary, sam, polly, terry, alice, john, darnel] // objects of class Student to not conform to protocol Comparable, so they can not use sort() funcs straight forward

let sortedByMathMark = students.sorted(by: { lhs, rhs in //sorts array from the highest maths mark to the lowest(compares "left" and "right" objects in array iterativly)
    return lhs.mathMark > rhs.mathMark
}) // the disadvantage of the approach is that its algorhythm has high level of difficulty

sortedByMathMark

extension Student: Comparable { //we can make our class conform Comparable protocol in order to use built-in sort algorhythms(but they are also not convenient in terms of efficiency)
    static func < (lhs: Student, rhs: Student) -> Bool {
        lhs.fullName < rhs.fullName
    }
    
    static func == (lhs: Student, rhs: Student) -> Bool {
        lhs.fullName < rhs.fullName
    }
}

students.sorted()
// The decision above is not efficient and makes code not reusableswift

extension Sequence { // array conforms to Sequence protocol, the extension below adds functionality for sorting elements in array with the given parameter(so that we do not have to write separate closure for every matter of sort in every array)
    func sorted<T: Comparable>(by keyPath: KeyPath<Element, T>) -> [Element] {// keypath is a way of storing references to properies without getting direct access to values, so that we can pass names of prooerties as parameters of the functions and comparre them fr sorting arrays
        return sorted { lhs, rhs in
            return lhs[keyPath: keyPath] < rhs[keyPath: keyPath]
        }
    }
}

students.sorted(by: \.academicYear)
students.sorted(by: \.programmingMark)

let filtered = students.filter( {$0.academicYear > 1 && $0.fullName.contains("a")} )// fill new array with students with academicYear > 1 and letter "a" in name

filtered.count

//MARK: Sets

let footballersId: Set = ["089", "354", "452", "374", "467", "309", "345", "098"] // unordered space of values, all are unique
let runnersId: Set = ["457", "354", "452", "122", "894", "309", "340"]

let eliteRunners = runnersId.filter { $0.contains("9") }// filtering can be applied for sets

footballersId.intersection(runnersId) // intersection of two sets
footballersId.subtracting(runnersId) // values which are presented only in first array
footballersId.symmetricDifference(runnersId) //unique values in each array
footballersId.isDisjoint(with: runnersId) //returns true if sets have no common elements
footballersId.union(runnersId) //all values from both sets, but no coalesings

for identificator in footballersId.sorted() {
    print(identificator)
}

var studentSet: Set = [mary, sam, polly, terry, alice, john, darnel]
studentSet.sorted(by: \.academicYear) //solution for sort from the previous section works for sets



//MARK: Dictionaries

var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin", "MNH": "Munich", "MSK": "Moskou"] //constructed from key-value pairs. Key must conform to Hashable protocol

if let oldValue = airports.updateValue("Dublin airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue)")
}

for (code, name) in airports {
    print("\(code) is code for \(name)")
}

for airportCode in airports.keys {
    print("Code: \(airportCode)")
}

for airportName in airports.values {
    print("Name: \(airportName)")
}

airports.keys.contains { key -> Bool in //checks if contains element with given key
    key == "YYZ"
}

airports.index(forKey: "MNH") != nil// another way to check if the element with key exists in array

let digitWords = ["one", "two", "three", "four", "five"]
let wordToValue = Dictionary(uniqueKeysWithValues: zip(digitWords, 1...5))

wordToValue["two"] ?? -1 //getting value by its key
wordToValue["seven"] ?? -1 //such key does not exist

var responseMessages = [200: "OK",
                        403: "Access forbidden",
                        404: "File not found",
                        500: "Internal server error"]
 
let httpResponseCodes = [200, 403, 301]
for code in httpResponseCodes { // if key from responseMessages is found in httpResponseCodes
    let message = responseMessages[code, default: "Unknown response"]
    print("Response \(code): \(message)")
}


