import UIKit
import Foundation

let universityName = [[
                        "Belarusian ",
                        "State ",
                        "University of ",
                        "Informatics and ",
                        "Radioelectronics"],
                      [
                        "Belarusian",
                        "State",
                        "University"],
                      [
                        "Belarusian",
                        "State",
                        "Medical",
                        "University"]
]

for university in universityName {
    print(university.map { $0.first! })//map allows to iterate through subarrays and delivers array, which contains subarray, which represent the abreviations of phrases in start arrays
}

let majors = [
    143: "Informational Systems and Technologies in Business Management",
    109: "Engineering and Psychology in Informational Technologies",
    126: "Programmable Mobile Systems"
]

let containsInformational = majors.mapValues { $0.contains("Informational") } // contains true and false elements depending on if the value in dictionary key-value pair contains substring "Informational"
print(containsInformational)

let strings = ["bsuir", "bseu", "bsu", "bsmu", "bstu"]
let uppercased = strings.map { $0.uppercased() }// no need to write cycles to iterate through all characters of all elements in array
print(uppercased)


let numerics: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

func findNumerics(in string: String) -> [String] {
    let words = string.components (
        separatedBy: .whitespacesAndNewlines // break string into separated words
    )
    
    let numbers = words.filter { numerics.contains($0.first!) }// numbers contains only words, win which first symbol if contained in numerics set (which means the word is a number)
    
   // print(numbers)
    return numbers
}

let stringExample = "If a column that you want to sort contains both numbers and text—such as Product 1, Product 60, Product 800 — it may not sort as you expect. You can format cells that contain 15, 60, and 25 so that they appear in the worksheet as Product 93, Product 100, and Product 78 ."

//findNumerics(in: stringExample)

let stringArray = ["If a column that you want to sort contains both numbers and text—such as Product 1, Product 60, Product 800 — it may not sort as you expect. You can format cells that contain 15, 60, and 25 so that they appear in the worksheet as Product 93, Product 100, and Product 78.",  "5 x 6 = 30 9 ÷ 3 = 3 Question 3 : 7. Question 1 : 8. Question 2 : 2"]//if we use just map for more than 1 dimensional array, we will get the same dimension array as an input one

//use flatMap to place all filtered or modified elements into 1-dimensional array
let numberArray = stringArray.flatMap(findNumerics)
print(numberArray)

//Array above may contain not only clean numbers, but also "words" which start with number and have other symbols further. To solve it we can use compact map, which filters nil values(is we try to convert not suitable string to int, it turn nil)
let ints = numberArray.compactMap { Int($0) }
print(ints)

let weather = ["minsk": 10, "rome": 15, "stockholm": 12, "paris": 8, "amsterdam": 11, "tokyo": 18, "Oslo": 12, "London": 16]

let cities = weather.map { (key, value) in //create plain array only with city names
    return key.capitalized//make all first letters capital
}

print(cities)

let filterByTemp = weather.filter { $1 > 14 }// filter cities with tempertaure below 14($0 sign is user for keys, $1 - for values)
print(filterByTemp)

let uniName = universityName[0].reduce(" ", +) //reduce helps to unite values of array
print(uniName)

var arrayOfNumbers: [[Int]] = []
arrayOfNumbers.append(ints)
arrayOfNumbers.append(ints)

let squarresOfEvenNumbers = arrayOfNumbers.flatMap{$0}.filter{ $0 % 2 == 0 }.map{ $0 * $0 }//it is possible to combine more than one operator in 1 expression
print(squarresOfEvenNumbers)

var countriesAndContinents = ["France": "Europe", "Germany": "Europe",
                              "United States of America": "America",
                              "United Kingdom": "Europe",
                              "Australia": "Australia",
                              "Greece": "Europe", "Italy": "Europe",
                              "Spain": "Europe", "Canada": "America",
                              "Egypt": "Africa"]


let european = countriesAndContinents.filter { $0.value == "Europe" }.map { (key, value) in//filter to leave only countries from europe and map for filling array only with key vlaues(which are countries names)
    return key.capitalized
}

print(european)
