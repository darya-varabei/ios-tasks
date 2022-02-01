//
//  BookViewModel.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/16/22.
//

import Foundation

class BookViewModel {

    fileprivate var books = [Book]()
    fileprivate var booksToCollection = [Book]()
    fileprivate var featuredIsbn = [Identifier]()

    private var delegate: ControllerDelegate = BooksCoordinator()
    var controllerDelegate: ControllerDelegate?
    private var bookService: BookServiceProtocol
    private var isBeingFiltered = false
    
    var reloadCollectionView: (() -> Void)?
    
    var bookCellViewModels = [BookCellViewModel]() {
        didSet {
            reloadCollectionView?()
        }
    }
    
    init(bookService: BookServiceProtocol = BookService(), delegate: ControllerDelegate) {
        self.delegate = delegate
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
    
    func getAllBooks() -> [Book] {
        return books
    }
    
    func getBooksForCollection() -> [Book] {
        return booksToCollection
    }
    
    func getFeaturedIsbn() -> [Identifier] {
        return featuredIsbn
    }
    
    func goToDetailView(flow: AppFlow, cellViewModel: BookCellViewModel?, viewModelGetObject: ViewModelGetObject?) {
        delegate.goToDetailView(flow: flow, cellViewModel: cellViewModel, viewModelObject: viewModelGetObject)
    }
    
    func resetToRoot() {
        delegate.resetToRoot(animated: true)
    }
}


class FeaturedBookViewModel: BookViewModel {
    
    private var delegate: ControllerDelegate?
    
    override init(bookService: BookServiceProtocol = BookService(), delegate: ControllerDelegate) {
        super.init(bookService: bookService, delegate: delegate)
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
