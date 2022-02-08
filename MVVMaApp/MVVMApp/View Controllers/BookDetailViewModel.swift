//
//  ViewModelGetObject.swift
//  MVVMApp
//
//  Created by Darya on 1/18/22.
//

import Foundation
import UIKit

struct BookDetailViewModel {
   
    private unowned let bookViewModel: BookViewModel
    private var isFeatured: Bool
    
    init(isFeatured: Bool, bookViewModel: BookViewModel) {
        self.isFeatured = isFeatured
        self.bookViewModel = bookViewModel
    }
    
    func setIfFeatured() -> Bool {
        return isFeatured
    }
    
    mutating func toggleFeaturedState() {
        isFeatured.toggle()
    }
    
    func updateFeaturedIndexes(isbn: String, setFeatured: Bool) {
        
        var indexes: [String] = []
        var featuredIsbn = bookViewModel.getFeaturedIsbn()
        for index in bookViewModel.getFeaturedIsbn() {
            indexes.append(index.isbn)
        }
        switch(setFeatured) {
        
        case true, !indexes.contains(isbn):
            featuredIsbn.append(Identifier(isbn: isbn))
            break
            
        case false, indexes.contains(isbn):
            for index in 0..<bookViewModel.getFeaturedIsbn().count {
                if bookViewModel.getFeaturedIsbn()[index].isbn == isbn {
                    featuredIsbn.remove(at: index)
                    break
                }
            }
           
            bookViewModel.modifyIndexesFile(items: featuredIsbn)
            break
            
        default:
            break
        }
    }
    
    func getBookViewModel() -> BookViewModel? {
        return bookViewModel
    }
}
