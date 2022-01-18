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
    
    var bookCellViewModels = [BookCellViewModel]() {
        didSet {
            reloadCollectionView?()
        }
    }
    
    init(bookService: BookServiceProtocol = BookService()) {
        self.bookService = bookService
    }
    
    func getBooks() {
        bookService.getAllBooks { model, success in
            if success ?? false, let books = model {
                self.fetchData(books: books)
            } else {
                print(success!)
            }
        }
    }
    
    func fetchData(books: [Book]) {
        self.books = books
        var vms = [BookCellViewModel]()
        for book in books {
            vms.append(createCellModel(book: book))
        }
        bookCellViewModels = vms
    }
    
    func createCellModel(book: Book) -> BookCellViewModel {
        let bookModel = BookCellViewModel(book: book)
        return bookModel
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> BookCellViewModel {
        return bookCellViewModels[0]
    }
    
    func getViewModel(index: Int) -> ViewModelGetObject {
            return ViewModelGetObject(book: books[index])
        }
}
