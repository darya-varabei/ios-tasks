//
//  Parsetr.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/16/22.
//

import Foundation
import UIKit

struct Parser {
    
    private enum ParsingParameters {
        static let successCode = 200
        static let fileExtension = "json"
    }
    
    static func loadJSONFile<T: Decodable>(named filename: String,
                                           type: T.Type,
                                           queue: DispatchQueue? = DispatchQueue.global(qos: .background),
                                           completionHandler: @escaping (T?, ParserError?) -> Void) {
        guard let url = Bundle.main.url(forResource: filename, withExtension: ParsingParameters.fileExtension) else {
            if let dispatchQueue = queue {
                dispatchQueue.async {
                    completionHandler(nil, .fileNotFound)
                }
            } else {
                completionHandler(nil, .fileNotFound)
            }
            
            return
        }
        
        let request = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? ParsingParameters.successCode
            
            if statusCode != ParsingParameters.successCode {
                if let dispatchQueue = queue {
                    dispatchQueue.async {
                        completionHandler(nil, .invalidRequest)
                    }
                } else {
                    completionHandler(nil, .invalidRequest)
                }
                
                return
            }
            
            do {
                if let jsonData = data {
                    let decoder = JSONDecoder()
                    let typedObject: T? = try decoder.decode(T.self, from: jsonData)
                    
                    if let dispatchQueue = queue {
                        dispatchQueue.async {
                            completionHandler(typedObject, nil)
                            print(url.absoluteURL)
                        }
                    } else {
                        completionHandler(typedObject, nil)
                        print(url.absoluteURL)
                    }
                }
            } catch {
                
                if let dispatchQueue = queue {
                    dispatchQueue.async {
                        completionHandler(nil, .parsingError)
                    }
                } else {
                    completionHandler(nil, .parsingError)
                }
            }
        }
        dataTask.resume()
    }
    
    static func writeToJsonFile(named filename: String,
                                queue: DispatchQueue? = DispatchQueue.global(qos: .background), items: String) {
        do {
            let encodedData = try NSKeyedArchiver.archivedData(withRootObject: items, requiringSecureCoding: false)
            let userDefaults = UserDefaults.standard
            userDefaults.set(encodedData, forKey: "featured")
        }
        catch {
            
        }
        //UserDefaults.standard.setValue(items, forKey: "featured")
//        let str = "arrayOfCountries.map { $0.city  + String($0.isMarked)}.joined(separator:)"
//                print("rRRRRRRRRRRRRRRRRRRRRRRRR")
//                do {
//                    if let path = Bundle.main.url(forResource: "cities", withExtension: "txt") {
//                        try str.write(toFile: String(contentsOf: path), atomically: true, encoding: .utf8)
//                    }
//                } catch {
//                    print(error.localizedDescription)
//                }
        
//        guard let documentDirectoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
//            let fileUrl = documentDirectoryUrl.appendingPathComponent("Persons.json")
//
//            let personArray =  [["person": ["name": "Dani", "age": "24"]], ["person": ["name": "ray", "age": "70"]]]
//
//            // Transform array into data and save it into file
//            do {
//                let data = try JSONSerialization.data(withJSONObject: personArray, options: [])
//                try data.write(to: fileUrl, options: [])
//            } catch {
//                print(error)
//            }
        
//        guard let url = Bundle.main.url(forResource: filename, withExtension: ParsingParameters.fileExtension) else {
//            if let dispatchQueue = queue {
//                dispatchQueue.async {
//                    print(ParserError.fileNotFound)
//                   // completionHandler(nil, .fileNotFound)
//                }
//            } else {
//                print(ParserError.fileNotFound)
//               // completionHandler(nil, .fileNotFound)
//            }
//
//            return
//        }
//        let pathDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
//        try? FileManager().createDirectory(at: pathDirectory, withIntermediateDirectories: true)
//        let filePath = pathDirectory.appendingPathComponent("FeaturedBooks.json")
//
//        let levels = ["unlocked", "locked", "locked"]
//        let json = try? JSONEncoder().encode(levels)
//
//        do {
//             try json!.write(to: filePath)
//        } catch {
//            print("Failed to write JSON data: \(error.localizedDescription)")
//        }
//        do {
//            guard let fileURL = Bundle.main.url(forResource: filename, withExtension: ParsingParameters.fileExtension) else { return }
//
//            let encoder = JSONEncoder()
//            try encoder.encode(items).write(to: fileURL)
//            print("4444444444444444444444444444444444")
//            print(items)
//            print("\n\n\n\n\n\n\n\n\n\n")
//        } catch {
//            print(error.localizedDescription)
//        }
    }
}
