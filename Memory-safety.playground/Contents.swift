import UIKit
import Foundation

//Memory conflicts occur when different parts of the programm try to access the same area in memory(particulary in multithreading programms)

print("---Conflicting inout parameters")

var celsius = 273

func translateToFarengheit(_ temp: inout Int){
    temp += celsius
}

//translateToFarengheit(&celsius)//conflict happens. Programm tries to access celsius variable both as an inout parameter and function's inner variable

var copyOfCelsius = celsius//create a copy of celsius

translateToFarengheit(&copyOfCelsius)//error is solved, as now programm refers to celsius and its copy, so that conflict does not occur


func computeTemp(_ temp1: inout Int, _ temp2: inout Int){
    temp1 = (temp1/5) * 9 + 32
    temp2 += 273
}

var tempToFarengheit = 20
var tempToKelvins = 15

computeTemp(&tempToFarengheit, &tempToKelvins)//no error, access to different variables
//computeTemp(&tempToFarengheit, &tempToFarengheit)//error calling the same variable for two inout parameters

var copyOfTempToFarengheit = tempToFarengheit

computeTemp(&tempToFarengheit, &copyOfTempToFarengheit)//no error after using a copy of variable as a second parameter


print("---Conflicting access to self")

struct Phone{
    let model: String
    var number: String
    var currentCall: String?
    
    mutating func makeCall(to number: inout String){
        self.currentCall = number
    }
}

var apple = Phone(model: "Apple", number: "123456789")
var samsung = Phone(model: "Samsung", number: "987654321")

//apple.makeCall(to: &apple.number)//error occurs, as the overlaping access to "apple" is presented. Can be resolved by making a copy of "apple.number" or "apple"
apple.makeCall(to: &samsung.number)//no error
