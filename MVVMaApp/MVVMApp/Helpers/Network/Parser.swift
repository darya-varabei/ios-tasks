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
                        }
                    } else {
                        completionHandler(typedObject, nil)
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
                                queue: DispatchQueue? = DispatchQueue.global(qos: .background), items: [Identifier]) {
        do {
            guard let fileURL = Bundle.main.url(forResource: filename, withExtension: ParsingParameters.fileExtension) else { return }

            let encoder = JSONEncoder()
            try encoder.encode(items).write(to: fileURL)
        } catch {
            print(error.localizedDescription)
        }
    }
}
