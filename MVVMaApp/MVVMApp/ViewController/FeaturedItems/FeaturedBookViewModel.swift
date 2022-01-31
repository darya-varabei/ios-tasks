//
//  FeaturedBookViewModel.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/19/22.
//

import Foundation

class FeaturedBookViewModel: BookViewModel {
    
    override init(bookService: BookServiceProtocol = BookService()) {
        super.init(bookService: bookService)
    }
    
    override  func fetchData(books: [Book]) {
        self.books = books
        var cellViewModel = [BookCellViewModel]()
        filterFeaturedBooks()
        for book in books {
            cellViewModel.append(createCellModel(book: book))
        }
        bookCellViewModels = cellViewModel
    }
    
    override func getViewModel(index: Int) -> ViewModelGetObject {
        return ViewModelGetObject(book: books[index], isFeatured: true, bookViewModel: self)
    }
    
    func filterFeaturedBooks() {
        var indexes: [String] = []
        for index in featuredIsbn {
            indexes.append(index.isbn)
        }
        let bufferArray = books.filter { indexes.contains($0.isbn ?? "") }
        books = bufferArray
    }
}
