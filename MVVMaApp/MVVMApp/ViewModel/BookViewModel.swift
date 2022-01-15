//
//  BookViewModel.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/16/22.
//

import Foundation

struct BookViewModel {
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
    
    mutating func getBooks() {
        bookService.getAllBooks { model, success in
            if success ?? false, let books = model {
                self.fetchData(books: books)
            } else {
                print(success)
            }
        }
    }
    
    mutating func fetchData(books: [Book]) {
        self.books = books
        var vms = [BookCellViewModel]()
        for book in books {
            vms.append(createCellModel(employee: book))
        }
        bookCellViewModels = vms
    }
    
    func createCellModel(book: Book) -> BookCellViewModel {
        let title = book.title
        let author = book.authors.joined(separator: ", ")
        let image = book.thumbnailUrl
        
        let bookModel = BookCellViewModel(book: (title, author, image))
        
        return BookCellViewModel(title, author, image)
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> BookCellViewModel {
        return bookCellViewModels[indexPath.row]
    }
}
