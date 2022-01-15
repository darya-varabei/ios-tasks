//
//  BookService.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/16/22.
//

import Foundation

class BookService: BookServiceProtocol {
    
    var macosVersions: [Book]?
    
    private enum Filename {
        static let macosVersions = "Macos-Versions"
        static let macosXVersions = "MacosX-Versions"
    }
    
    func getAllBooks(completion: @escaping ([Book]?, Bool?) -> Void) {
        
        Parser.loadJSONFile(named: Filename.macosVersions, type: [Book].self) { (versions, error) in
            guard error == nil else {
                completion(nil, false)
                return
            }
            
            Parser.loadJSONFile(named: Filename.macosXVersions, type: [Book].self) { (versionsX, error) in
                guard error == nil else {
                    completion(nil, false)
                    return
                }
                
                self.macosVersions = versions ?? []
                completion(versions, true)
            }
        }
    }
}
