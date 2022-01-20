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
    
    func getAllBooks(completion: @escaping ([Book]?, Bool?, [Identifier]?, Bool?) -> Void) {
        
        Parser.loadJSONFile(named: Filename.bookList, type: [Book].self) { (models, error) in
            guard error == nil else {
                completion(nil, false, nil, false)
                return
            }
            
                        Parser.loadJSONFile(named: Filename.featuredBookList, type: [Identifier].self) { (featuredIsbn, error) in
                            guard error == nil else {
                                Parser.writeToJsonFile(named: Filename.featuredBookList, items: [Identifier(isbn: "yfgfiyeg"), Identifier(isbn: "yfgfiyeg") ])
                                completion(nil, false, nil, false)
                                return
                            }
            
//            if UserDefaults.standard.string(forKey: "featured") != nil{
//
                completion(models, true, featuredIsbn, true)
//            }
//            else {
//                completion(models, true, "-", true)
//            }
                       }
        }
    }
    
    func writeFeaturedIndexes(items: [Identifier]) {
        print(items)
        Parser.writeToJsonFile(named: "Test", items: items)
    }
}

