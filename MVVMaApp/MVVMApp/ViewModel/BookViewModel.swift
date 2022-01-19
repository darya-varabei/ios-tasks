//
//  BookViewModel.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/16/22.
//

import Foundation

class BookViewModel {
    private var bookService: BookServiceProtocol
    var reloadCollectionView: (() -> Void)?
    
    var books = [Book]()
    var booksToCollection = [Book]()
    var featuredIsbn = [Identifier]()
    
    var bookCellViewModels = [BookCellViewModel]() {
        didSet {
            reloadCollectionView?()
        }
    }
    
    init(bookService: BookServiceProtocol = BookService()) {
        self.bookService = bookService
        self.booksToCollection = books
    }
    
    func getBooks() {
        bookService.getAllBooks { model, success, featured, featuredSuccess in
            if success ?? false, let books = model, let featuredModel = featured {
                self.fetchData(books: books)
                self.fetchFeaturedIsbn(featuredIsbn: featuredModel)
            } 
        }
    }
    
    func fetchData(books: [Book]) {
        self.books = books
        self.booksToCollection = books
        var vms = [BookCellViewModel]()
        for book in booksToCollection {
            vms.append(createCellModel(book: book))
        }
        bookCellViewModels = vms
    }
    
    func fetchFeaturedIsbn(featuredIsbn: [Identifier]) {
        self.featuredIsbn = featuredIsbn
    }
    
    func createCellModel(book: Book) -> BookCellViewModel {
        let bookModel = BookCellViewModel(book: book)
        return bookModel
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> BookCellViewModel {
        return bookCellViewModels[indexPath.item]
    }
    
    func getViewModel(index: Int) -> ViewModelGetObject {
            return ViewModelGetObject(book: books[index])
    }
    
    func filterBooks(on category: String) {
        if books.count == booksToCollection.count {
            booksToCollection.removeAll()
            for book in books {
                if book.categories.contains(category) {
                    booksToCollection.append(book)
                }
            }
            fetchData(books: booksToCollection)
        }
        else {
            booksToCollection = books
            fetchData(books: booksToCollection)
        }
    }
}
