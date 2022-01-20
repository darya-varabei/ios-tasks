//
//  BookService.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/16/22.
//

import Foundation
import UIKit

class BookService: BookServiceProtocol {
    
    private enum Filename {
        static let bookList = "Books"
        static let featuredBookList = "FeaturedBooks"
    }
    
    func getAllBooks(completion: @escaping ([Book]?, Bool?, String?, Bool?) -> Void) {
        
        Parser.loadJSONFile(named: Filename.bookList, type: [Book].self) { (models, error) in
            guard error == nil else {
                completion(nil, false, nil, false)
                return
            }
            
            //            Parser.loadJSONFile(named: Filename.featuredBookList, type: [Identifier].self) { (featuredIsbn, error) in
            //                guard error == nil else {
            //                    completion(nil, false, nil, false)
            //                    return
            //                }
            
            if UserDefaults.standard.string(forKey: "featured") != nil{
                
                completion(models, true, UserDefaults.standard.string(forKey: "featured"), true)
            }
            else {
                completion(models, true, "-", true)
            }
            //            }
        }
    }
    
    func writeFeaturedIndexes(items: String) {
        print(items)
        Parser.writeToJsonFile(named: "Test", items: items)
    }
}
