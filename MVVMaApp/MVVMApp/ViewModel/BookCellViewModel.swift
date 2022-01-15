//
//  BookCellViewModel.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/15/22.
//

import Foundation
import UIKit

struct BookCellViewModel {
    
    private let book: Book
    
    var title: String {
        return book.title
    }
    
    var author: String {
        return book.authors.joined(separator: ", ")
    }
    
    var image: String {
        return book.thumbnailUrl
    }
    
    var isbn: String {
        return book.isbn
    }
    
    var overview: String {
        return book.longDescription
    }
    
    var numOfPages: Int {
        return book.pageCount
    }
    
    var publishedDate: PublishedDate {
        return book.publishedDate
    }
    
    var category: [String] {
        return book.categories
    }
    
    var status: String {
        return book.status
    }
}
