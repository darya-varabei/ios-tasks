//
//  BookService.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/16/22.
//

import Foundation

class BookService: BookServiceProtocol {
    
    var books: [Book]?
    
    private enum Filename {
        static let bookList = "Books"
        static let featuredBookList = "FeaturedBooks"
    }
    
    func getAllBooks(completion: @escaping ([Book]?, Bool?) -> Void) {
        
        Parser.loadJSONFile(named: Filename.bookList, type: [Book].self) { (models, error) in
            guard error == nil else {
                completion(nil, false)
                return
            }
//
//            Parser.loadJSONFile(named: Filename.macosXVersions, type: [Book].self) { (versionsX, error) in
//                guard error == nil else {
//                    completion(nil, false)
//                    return
//                }
//
                self.books = models ?? []
                completion(models, true)
//            }
        }
    }
}