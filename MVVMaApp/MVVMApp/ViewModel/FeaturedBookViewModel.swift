//
//  FeaturedBookViewModel.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/19/22.
//

import Foundation

class FeaturedBookViewModel {
    private var bookService: BookServiceProtocol
    var reloadCollectionView: (() -> Void)?
    
    var featuredBooks = [Book]()
    var featuredIsbn = [Identifier]() 
    
    var bookCellViewModels = [BookCellViewModel]() {
        didSet {
            reloadCollectionView?()
        }
    }
    
    init(bookService: BookServiceProtocol = BookService()) {
        self.bookService = bookService
    }
    
    func getBooks() {
        bookService.getAllBooks { model, success, featured, featuredSuccess in
            if success ?? false, let books = model, let featuredModel = featured {
                self.fetchFeaturedIsbn(featuredIsbn: featuredModel)
                self.fetchData(books: books)
            } else {
                print(success!)
            }
        }
    }
    
    func fetchData(books: [Book]) {
        self.featuredBooks = books
        var vms = [BookCellViewModel]()
        filterFeaturedBooks()
        for book in featuredBooks {
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
            return ViewModelGetObject(book: featuredBooks[index])
        }
    
    func filterFeaturedBooks() {
        var indexes: [String] = []
        for i in featuredIsbn {
            indexes.append(i.isbn)
        }
        let bufferArray = featuredBooks.filter { indexes.contains($0.isbn ?? "") }
        featuredBooks = bufferArray
    }
}
