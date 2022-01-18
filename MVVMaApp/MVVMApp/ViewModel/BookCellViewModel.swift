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
    //private let service: BookService = BookService()
    
    init(book: Book) {
        self.book = book
    }
    
    var title: String {
        return book.title
    }
    
    var author: String {
        return book.authors.joined(separator: ", ")
    }
    
    var image: UIImage {
//        if let url = URL(string: book.thumbnailURL ?? "") {
////            DispatchQueue.main.async {
//            return service.loadImage(from: url)
//            // }
//        }
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
    
//    var publishedDate: PublishedDate {
//        return book.publishedDate ?? PublishedDate
//    }
    
    var category: [String] {
        return book.categories
    }
}
