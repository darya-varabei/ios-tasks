//
//  BookViewModel.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/16/22.
//

import Foundation

class BookViewModel {

    fileprivate var books = Observable<[Book]>()
    fileprivate var booksToCollection = Observable<[Book]>()
    fileprivate var featuredIsbn = [Identifier]()

    private var delegate: ControllerDelegate
    private var controllerDelegate: ControllerDelegate?
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
        self.books.value = books
        self.booksToCollection.value = books
        createCellViewModel()
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
        
        if indexes.contains(books.value?[index].isbn ?? "") {
            isFeatured = true
        }
        return ViewModelGetObject(book: books.value?[index], isFeatured: isFeatured, bookViewModel: self)
    }
    
    func filterBooks(on category: String, isSelected: Bool) {
        
        booksToCollection.value?.removeAll()
        if !isSelected && !isBeingFiltered {
            booksToCollection.value = (books.value ?? []).filter { $0.categories.contains(category) }
        }
        else if isSelected && isBeingFiltered {
            booksToCollection = books
        }
        else {
            booksToCollection.value = (books.value ?? []).filter { $0.categories.contains(category) }
        }
        createCellViewModel()
        isBeingFiltered.toggle()
    }
    
    func modifyIndexesFile(items: [Identifier]) {
        bookService.writeFeaturedIndexes(items: items)
    }
    
    func getAllBooks() -> Observable<[Book]> {
        return books
    }
    
    func getBooksForCollection() -> Observable<[Book]> {
        return booksToCollection
    }
    
    func getFeaturedIsbn() -> [Identifier] {
        return featuredIsbn
    }
    
    func getViewControllerDelegate() -> ControllerDelegate? {
        return controllerDelegate
    }
    
    func goToDetailView(flow: AppFlow, cellViewModel: BookCellViewModel?, viewModelGetObject: ViewModelGetObject?) {
        delegate.goToDetailView(flow: flow, cellViewModel: cellViewModel, viewModelObject: viewModelGetObject)
    }
    
    func resetToRoot() {
        delegate.resetToRoot(animated: true)
    }
    
    private func createCellViewModel() {
        var cellViewModels = [BookCellViewModel]()
        for book in booksToCollection.value ?? [] {
            cellViewModels.append(createCellModel(book: book))
        }
        bookCellViewModels = cellViewModels
    }
    
    private func fetchFeaturedIsbn(featuredIsbn: [Identifier]) {
        self.featuredIsbn = featuredIsbn
    }
}


class FeaturedBookViewModel: BookViewModel {
    
    private var delegate: ControllerDelegate?
    
    override init(bookService: BookServiceProtocol = BookService(), delegate: ControllerDelegate) {
        super.init(bookService: bookService, delegate: delegate)
    }
    
    override  func fetchData(books: [Book]) {
        self.books.value = books
        var cellViewModel = [BookCellViewModel]()
        filterFeaturedBooks()
        for book in books {
            cellViewModel.append(createCellModel(book: book))
        }
        bookCellViewModels = cellViewModel
    }
    
    override func getViewModel(index: Int) -> ViewModelGetObject {
        return ViewModelGetObject(book: books.value?[index], isFeatured: true, bookViewModel: self)
    }
    
    func filterFeaturedBooks() {
        var indexes: [String] = []
        for index in featuredIsbn {
            indexes.append(index.isbn)
        }
        let bufferArray = (books.value ?? []).filter { indexes.contains($0.isbn ?? "") }
        books.value = bufferArray
    }
}
