import UIKit

// MARK: Part 1
class Tutor {
    let firstName: String
    let surname: String
    let rank: String
    
    init(firstName: String, surname: String, rank: String){
        self.firstName = firstName
        self.surname = surname
        self.rank = rank
    }
    var fullName: String{
    return "\(firstName) \(surname): \(rank)"
    }
}

protocol Course{
    var fullName: String { get }
    var tutor: Tutor { get }
}

protocol LaboratoryWork{
    var equipment: String { get }
}

protocol Practice {
    var recommendedLiterature: [String] { get }
}
protocol Lecture {
    var codeOfRoom: String { get }
}

class Programming: Course{
    let fullName: String
    let tutor: Tutor
    
    init(fullName: String, tutor: Tutor){
        self.fullName = fullName
        self.tutor = tutor
    }
}

let oop = Programming(fullName: "Object Oriented Programming", tutor: Tutor(firstName: "Name", surname: "Surname", rank: "Professor"))

extension Programming: LaboratoryWork, Lecture{
    var equipment: String {
        return "Requires computers"
    }
    var codeOfRoom: String {
        return "104b - 2"
    }
}

class GameDevelopment: Programming{
    let description: String = "Develop Games"
}

let game = GameDevelopment(fullName: "Game Development", tutor: Tutor(firstName: "Name", surname: "Surname", rank: "Professor"))


// MARK: Part 2
//protocols defining units of work performed by Employee
protocol Coding {
    var language: String { get }
    func defineLanguage() -> String
}
protocol Debugging {}
protocol MeetingAttending {
    func scheduleMeeting() -> String
    func callEnvironment() -> String
}
protocol Mentoring {
    func trainingProgramm() -> String
}
protocol Designing {
    func technologyStack() -> [String]
}
protocol Analyst {
    func technologyStack() -> [String]
}

protocol Developer: Coding, Debugging {}//class inherits responsibilities, described in protocols

class Employee: MeetingAttending{ // all Employees may have common responsibilities, which can be discribed in parent class
    func scheduleMeeting() -> String {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        return "Meeting is scheduled for \(hour):\(minutes)"
    }
    
    func callEnvironment() -> String{
        return "Connect in Skype"
    }
}

class Developers: Employee, Developer{ // Developers is inherited from Employee and conforms DEveloper protocol
    let language: String
    
    init(language: String){
        self.language = language
    }
    
    func defineLanguage() -> String{
        return "Primary language: \(language)"
    }
}

class JuniorDeveloper: Developers {}

class MiddleDeveloper: Developers {}

class SeniorDeveloper: Developers, Mentoring {// class inherits two protocols(and ca override their methods)
    func trainingProgramm() -> String {
        return "Mentor in \(language)"
    }
}

class Designer: Employee, Designing { // inherits Employee and conforms Designing protocol
    
    let specialization: String
    
    init(specialization: String){
        self.specialization = specialization
    }
    
    func technologyStack() -> [String]{
        return ["Figma", "Adobe Illustrator"]
    }
}

class BusinessAnalyst:Employee, Analyst { // inherits Employee and conforms Analyst protocol
    
    func technologyStack() -> [String] {
        return ["Excel", "Modus BI"]
    }
}


let developer = MiddleDeveloper(language: "Python")
developer.scheduleMeeting()

let experiencedDeveloper = SeniorDeveloper(language: "Swift")
experiencedDeveloper.trainingProgramm()
experiencedDeveloper.scheduleMeeting()
experiencedDeveloper.callEnvironment()
