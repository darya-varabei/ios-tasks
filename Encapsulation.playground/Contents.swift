import UIKit

enum Decode {
    case strong
    case average
    case light
}

class Person {
    let name: String
    var age: Int
    var height: Double
    var weight: Double
    let illnessDificulty: Int
    var medicication: Medication?
    
    public lazy var massIndex: Double = {//public modificator added as Medication needs to uses this property for computations
        return weight / (height * height)
    }()
    
    init(name: String, age: Int, height: Double, weight: Double, illnessDificulty: Int){
        self.name = name
        self.age = age
        self.height = height
        self.weight = weight
        self.illnessDificulty = illnessDificulty
    }
    
    public func BMIOutput() {
        print("BMI is \(massIndex)")
    }
    
    deinit{
        print("Person is deinitialized")
    }
}

class Medication {
    let name: String
    let code: Int
    unowned let acceptor: Person
    private static let codeMeaning = [101: .strong, 202: .average, 303: Decode.light]// common for all class instances
    
    private lazy var type: Decode = { [unowned self] in //possible reference cycle, which is solved by adding capture list
        let type = Medication.codeMeaning.filter{ $0.key == code }.map { (key, value) in
            return value
        }
        return type[0]// returning only a value of needed medication type
    }()
    
    internal func dosage() -> Int {
        switch(acceptor.massIndex) {
        case _ where acceptor.massIndex <= 18 || type == .strong || acceptor.age < 16:
            return 1
        case _ where acceptor.massIndex <= 20 || type == .light:
           return 2
        case _ where acceptor.massIndex <= 22:
            return 3
        case _ where acceptor.massIndex <= 24:
           return 4
        default:
           return 5
        }
    }
    
    init(name: String, code: Int, acceptor: Person) {
        self.name = name
        self.code = code
        self.acceptor = acceptor
    }
    
    public func dozeOutput() {
        print("Your doze is \(dosage())")
    }
    
    public func typeOutput() {
        print("The type is \(type)")
    }
    
    deinit{
        print("Medication is deinitialized")
    }
}

func createObjects(){
    let ann = Person(name: "Ann", age: 19, height: 1.70, weight: 60, illnessDificulty: 2)
    let paracetamol = Medication(name: "Paracetamol", code: 101, acceptor: ann)
    ann.medicication = paracetamol
    ann.BMIOutput()
    paracetamol.dozeOutput()
    paracetamol.typeOutput()
    //paracetamol.dosage// we do not get acces to private properties outside their class definitions
}

createObjects()

class Antibiotics: Medication {
    override func dosage() -> Int{
        switch(acceptor.massIndex) {
        case _ where acceptor.massIndex <= 22 || acceptor.age < 18:
            return 1
        case _ where acceptor.massIndex <= 24 || acceptor.weight < 60.0:
           return 2
        default:
           return 3
        }
    }
    
    private func recommendedDays() ->Int {
        switch (acceptor.illnessDificulty){
        case 1:
            return 7
        case 2:
            return 10
        default:
            return 14
        }
    }
    
    public func recommendedDaysOutput() {
        print("You should take it for \(recommendedDays()) days")
    }
}

func createObject() {
    let alan = Person(name: "Alan", age: 16, height: 1.80, weight: 73.7, illnessDificulty: 1)
    let paracetamol = Antibiotics(name: "Paracetamol", code: 101, acceptor: alan)
    alan.medicication = paracetamol
    alan.BMIOutput()
    paracetamol.dozeOutput()
    paracetamol.typeOutput()
    paracetamol.recommendedDaysOutput()
}

createObject()
