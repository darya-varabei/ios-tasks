//
//  BookService.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/16/22.
//

import Foundation
import UIKit

class BookService: BookServiceProtocol {
    
    var books: [Book]?
    var indexes: [Identifier]?
    
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
                    completion(nil, false, nil, false)
                    return
                }
                self.books = models ?? []
                self.indexes = featuredIsbn ?? []
                print("***************\(featuredIsbn?.count ?? 1)")
                completion(models, true, featuredIsbn, true)
            }
        }
    }
}
