//
//  BookViewModel.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/16/22.
//

import Foundation

class BookViewModel {
    var bookService: BookServiceProtocol
    var reloadCollectionView: (() -> Void)?
    
    var books = [Book]()
    var booksToCollection = [Book]()
    var featuredIsbn = [Identifier]()
    
    var isBeingFiltered = false
    
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
        bookService.getAllBooks { model, success, identifiers, identifiersSuccess in
            if success ?? false, let books = model, let featuredModel = identifiers {
                self.fetchFeaturedIsbn(featuredIsbn: featuredModel)
                self.fetchData(books: books)
            } 
        }
    }
    
    func fetchData(books: [Book]) {
        self.books = books
        self.booksToCollection = books
        createCellViewModel()
    }
    
    func createCellViewModel() {
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
        var indexes: [String] = []
        var isFeatured = false
        for i in featuredIsbn {
            indexes.append(i.isbn)
        }
        
        if indexes.contains(books[index].isbn ?? "") {
            isFeatured = true
        }
        return ViewModelGetObject(book: books[index], isFeatured: isFeatured, bookViewModel: self)
    }
    
    func filterBooks(on category: String) {
        if !isBeingFiltered {
            booksToCollection.removeAll()
            booksToCollection = books.filter { $0.categories.contains(category) }
            createCellViewModel()
        }
        else {
            booksToCollection = books
            fetchData(books: booksToCollection)
        }
    }
    
    func modifyIndexesFile(items: [Identifier]) {
        bookService.writeFeaturedIndexes(items: items)
    }
}
