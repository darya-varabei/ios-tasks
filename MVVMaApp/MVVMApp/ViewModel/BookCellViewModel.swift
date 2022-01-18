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
    
    init(book: Book) {
        self.book = book
    }
    
    var title: String {
        return book.title
    }
    
    var author: String {
        return book.authors.joined(separator: ", ")
    }
    
    var thumbnail: String {
        return book.thumbnailURL ?? ""
    }
    
    var image: UIImage {
        return UIImage()
    }
    
    var isbn: String {
        return book.isbn ?? ""
    }
    
    var overview: String {
        return book.longDescription ?? ""
    }
    
    var numOfPages: Int {
        return book.pageCount
    }
    
    var publishedDate: PublishedDate {
        return book.publishedDate ?? PublishedDate(date: "12.12.2001")
    }
    
    var category: [String] {
        return book.categories
    }
}
