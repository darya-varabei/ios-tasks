//
//  Parser.swift
//  macos-versions
//
//  Created by Дарья Воробей on 1/3/22.
//

import Foundation
import UIKit

struct Parser {
    
    static func loadJSONFile<T: Decodable>(named filename: String,
                                           type: T.Type,
                                           queue: DispatchQueue? = DispatchQueue.global(qos: .background),
                                           //simulateLoadDelay: Bool? = true,
                                           //delaySeconds: TimeInterval = 0.2,
                                           completionHandler: @escaping (T?, ParserError?) -> Void) {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            if let dispatchQueue = queue {
                dispatchQueue.async/*(deadline: DispatchTime.now() + delaySeconds)*/ {
                    completionHandler(nil, .fileNotFound)
                }
            } else {
                completionHandler(nil, .fileNotFound)
            }
            
            return
        }
        
        let request = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 200
            
            if statusCode != 200 {
                if let dispatchQueue = queue {
                    dispatchQueue.async/*After(deadline: DispatchTime.now() + delaySeconds)*/ {
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
                    decoder.dateDecodingStrategy = .custom { (decoder) -> Date in
                        let value = try decoder.singleValueContainer().decode(String.self)
                        
                        let formatter = DateFormatter()
                        formatter.dateFormat = "yyyy-MM-dd"
                        
                        if let date = formatter.date(from: value) {
                            return date
                        }
                        
                        throw ParserError.invalidDateFormat
                    }
                    
                    let typedObject: T? = try decoder.decode(T.self, from: jsonData)
                    
                    if let dispatchQueue = queue {
                        dispatchQueue.async/*After(deadline: DispatchTime.now() + delaySeconds)*/ {
                            completionHandler(typedObject, nil)
                        }
                    } else {
                        completionHandler(typedObject, nil)
                    }
                }
            } catch {
                print(error)
                
                if let dispatchQueue = queue {
                    dispatchQueue.async/*After(deadline: DispatchTime.now() + delaySeconds)*/ {
                        completionHandler(nil, .parsingError)
                    }
                } else {
                    completionHandler(nil, .parsingError)
                }
            }
        }
        
        dataTask.resume()
    }
}
