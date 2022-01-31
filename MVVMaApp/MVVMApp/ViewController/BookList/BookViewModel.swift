//
//  BookViewModel.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/16/22.
//

import Foundation

class BookViewModel {
    private var bookService: BookServiceProtocol
    private var isBeingFiltered = false
    
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
    
    private func createCellViewModel() {
        var cellViewModels = [BookCellViewModel]()
        for book in booksToCollection {
            cellViewModels.append(createCellModel(book: book))
        }
        bookCellViewModels = cellViewModels
    }
    
    private func fetchFeaturedIsbn(featuredIsbn: [Identifier]) {
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
        for index in featuredIsbn {
            indexes.append(index.isbn)
        }
        
        if indexes.contains(books[index].isbn ?? "") {
            isFeatured = true
        }
        return ViewModelGetObject(book: books[index], isFeatured: isFeatured, bookViewModel: self)
    }
    
    func filterBooks(on category: String, isSelected: Observable<Bool>) {
        
        booksToCollection.removeAll()
        if !isSelected.value && !isBeingFiltered {
            booksToCollection = books.filter { $0.categories.contains(category) }
        }
        else if isSelected.value && isBeingFiltered {
            booksToCollection = books
        }
        else {
            booksToCollection = books.filter { $0.categories.contains(category) }
        }
        createCellViewModel()
        isBeingFiltered.toggle()
    }
    
    func modifyIndexesFile(items: [Identifier]) {
        bookService.writeFeaturedIndexes(items: items)
    }
}
