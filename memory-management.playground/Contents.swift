import Foundation
import UIKit

class Team {
    var coach: Coach?
    
    init(){
        print("Team is initialized")
    }
    
    deinit{
        print("Team is deinitialized")
    }
}

class Coach {
    var name: String
    var team: Team?
    
    init(name: String){
        self.name = name
        print("Coach is initialized")
    }
    
    deinit{
        print("Coach is deinitialized")
    }
}


print("---Setting references")

//Allocate objects in memory
var team1: Team?
var team2: Team?
var team3: Team?

func initObjects(){
    //3 references on the same object
    team1 = Team()
    team2 = team1
    team3 = team1
    
    //free up references
    team1 = nil
    team2 = nil
    print("Still has 1 reference")
    
    team3 = nil
    
}

initObjects()



print("---Retain cycle")

//allocate coach and team in memory
var coach: Coach?
var team: Team?

//initialize coach and team(both have 1 reference)
coach = Coach(name: "Shane Orr")
team = Team()

//set up strong references between coach and team
coach!.team = team
team!.coach = coach

//References to coach and team objects are set to nil. But they are not deallocated from memory as they still have strong references on each other(their reference counters are equal to 1), so they can not be deallocated
coach = nil
team = nil


print("---Break retain cycle with weak modifier")


class Song {
    var name: String
    weak var singer: Singer?
    
    init(name: String){
        self.name = name
        print("Song is initialized")
    }
    
    deinit{
        print("Song is deinitialized")
    }
}

class Singer {
    var name: String
    weak var song: Song?
    
    init(name: String){
        self.name = name
        print("Singer is initialized")
    }
    
    deinit{
        print("Singer is deinitialized")
    }
}


var singer: Singer?
var song: Song?

//initialize singer and song(both have 1 reference)
singer = Singer(name: "Hollywood Undead")
song = Song(name: "Circles")

//set up WEAK references between song and singer
singer!.song = song
song!.singer = singer

//Song and singer will be deinitialized and deallocated successfully as weak references do not increase reference counter and after setting references on objects themselves to nil, their reference counters are set to 0 and object can be deinitialized
singer = nil
song = nil


print("---Break retain cycle with unowned modifier")


class User {
    var name: String
    var account: Account?
    
    init(name: String){
        self.name = name
        print("User is initialized")
    }
    
    deinit{
        print("User is deinitialized")
    }
}

//Account's lifespan is not longer than user's lifespan

class Account {
    var id: String
    unowned var user: User?
    
    init(id: String, user: User){
        self.id = id
        self.user = user
        print("Account is initialized")
    }
    
    deinit{
        print("Account is deinitialized")
    }
}

var marry: User?

//user sets a strong reference on account, account sets unowned reference to user()
marry = User(name: "Marry Ray")
marry?.account = Account(id: "72836te8g7", user: marry!)

//when setting "marry" reference to nil, its reference counter is set to zero and it gets deallocated. As we remember, account can not exist without user, so account is also deallocated
marry = nil


print("---Break retain cycle with unowned optional reference")


class Workout{
    var name: String
    var exercises: [Exercise]
    
    init(name: String){
        self.name = name
        self.exercises = []
    }
    
    deinit{
        print("Workout is deinitialized")
    }
}

class Exercise{
    var name: String
    unowned var workout: Workout//Workout's lifespan is longer than exercise's lifespan
    unowned var nextExercise: Exercise?//unowned optional reference, as it can be set to nil(for last exercise), but if we set a certain exercise next to a current, we should make sure it will not be deallocated
    
    init(name: String, workout: Workout){
        self.name = name
        self.workout = workout
        self.nextExercise = nil
    }
    
    deinit{
        print("\(self.name) is deinitialized")
    }
}


let workout: Workout?
workout = Workout(name: "Power-Push")

let exercise1 = Exercise(name: "Push-ups", workout: workout!)
let exercise2 = Exercise(name: "Dumbells press", workout: workout!)
let exercise3 = Exercise(name: "Bench press", workout: workout!)
exercise1.nextExercise = exercise2
exercise2.nextExercise = exercise3

//exercise3.nextExercise is nil by default

workout?.exercises = [exercise1, exercise2, exercise3]


print("---Strong reference cycle for closures")

//Closures are reference type, so they are also capable to capture instances and create strong reference cycles

class Ship {
    weak var cargo: Cargo?
    
    lazy var unloadCargo = { [unowned self] in//Set unowned reference on self, as in other case it will case strong reference cycle(closure retains object, which contains it)
        print("Unload cargo: \(self.cargo?.name ?? "")")
    }

    init() {
        print("Ship is initialized")
    }

    deinit {
        print("Ship is deinitialized")
    }
}

class Cargo {
    let name: String
    var ship: Ship?

    init(name: String) {
        print("Cargo is initialized")
        self.name = name
    }

    deinit {
        print("Cargo is deinitialized")
    }
}

var ship: Ship?
var cargo: Cargo?
ship = Ship()
    cargo = Cargo(name: "Cargo")
    ship!.cargo = cargo//weak reference to cargo
    cargo!.ship = ship//strong reference to ship
    ship!.unloadCargo()
//setting ship and cargo to nil deallocates them from memory, even through they are captured by inner closure, as they are assigned unowned in closure capture lists
ship = nil
cargo = nil

