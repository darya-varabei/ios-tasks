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
    let noOverviewAvailable = "No overview available"
    let noDateAvailable = "12.12.2001"
    
    init(book: Book) {
        self.book = book
    }
    
    var isFeatured: Bool {
        return true
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
    
    var isbn: String {
        return book.isbn ?? ""
    }
    
    var overview: String {
        guard let description = book.longDescription else { return noOverviewAvailable
        }
        if description != "" {
            return description
        }
        else {
            return noOverviewAvailable
        }
    }
    
    var numOfPages: Int {
        return book.pageCount
    }
    
    var publishedDate: PublishedDate {
        return book.publishedDate ?? PublishedDate(date: noDateAvailable)
    }
    
    var category: [String] {
        return book.categories
    }
}
