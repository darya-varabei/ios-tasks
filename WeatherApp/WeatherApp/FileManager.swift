//
//  FileManager.swift
//  WeatherApp
//
//  Created by Darya on 10/5/21.
//

import Foundation

struct City {
    var city: String
    var isMarked: String
}

class FileManagement {
    var citiesAndMarks: [City] = []
    let filename = "/Users/darya/Desktop/ios-tasks/WeatherApp/WeatherApp/cities.txt"
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func readData() -> [City] {
        var arrayOfStrings: [String]?
        var tempCity: City = City(city: "Minsk", isMarked: "1")
        
        do {
            if let path = Bundle.main.url(forResource: "cities", withExtension: "txt"){
                let data = try String(contentsOf:path, encoding: String.Encoding.utf8)
                arrayOfStrings = data.components(separatedBy: "\n")
            }
        } catch {
            print(error.localizedDescription)
        }
        
        if !(arrayOfStrings?.isEmpty ?? false) {
            for i in 0..<18 {
                let tempStr = arrayOfStrings?[i].components(separatedBy: "  ")
                tempCity.city = tempStr?[0] ?? "City"
                tempCity.isMarked = tempStr?[1] ?? "0"
                self.citiesAndMarks.append(tempCity)
            }
        }
        return self.citiesAndMarks
    }
    
    func saveData(_ arrayOfCountries: [City]) {
        let str = arrayOfCountries.map { $0.city + "  " + String($0.isMarked)}.joined(separator: "\n")
        
        do {
            if let path = Bundle.main.url(forResource: "cities", withExtension: "txt"){
                print(path)
                try str.write(toFile: String(contentsOf: path), atomically: true, encoding: .utf8)
            }
        } catch {
            print(error.localizedDescription)
        }
        
    }
}
