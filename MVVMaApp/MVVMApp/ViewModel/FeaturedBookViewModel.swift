//
//  FeaturedBookViewModel.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/19/22.
//

import Foundation

class FeaturedBookViewModel: BookViewModel {
    //private var bookService: BookServiceProtocol
    //var reloadCollectionView: (() -> Void)?
    var bookModel: BookViewModel?
    
    var featuredBooks = [Book]()
    //var featuredIsbn = [Identifier]()
    
   // var bookCellViewModels = [BookCellViewModel]() {
//        didSet {
//            reloadCollectionView?()
//        }
//    }
    
    override init(bookService: BookServiceProtocol = BookService()) {
        super.init(bookService: bookService)
        //self.bookService = bookService
    }
    
    override func getBooks() {
        bookService.getAllBooks { model, success, identifiers, identifiersSuccess in
            if success ?? false, let books = model , let featuredIsbn = identifiers{
                //self.featuredIsbn = featuredIsbn
                self.fetchFeaturedIsbn(featuredIsbn: featuredIsbn)
                self.fetchData(books: books)
            } 
        }
    }
    
    override func fetchData(books: [Book]) {
        self.featuredBooks = books
        var vms = [BookCellViewModel]()
        filterFeaturedBooks()
        for book in featuredBooks {
            vms.append(createCellModel(book: book))
        }
        bookCellViewModels = vms
    }
    
//    func fetchFeaturedIsbn(featuredIsbn: [Identifier]) {
//        self.featuredIsbn = featuredIsbn
//    }
    
//    func createCellModel(book: Book) -> BookCellViewModel {
//        let bookModel = BookCellViewModel(book: book)
//        return bookModel
//    }
    
//    func getCellViewModel(at indexPath: IndexPath) -> BookCellViewModel {
//        return bookCellViewModels[indexPath.item]
//    }
    
    override func getViewModel(index: Int) -> ViewModelGetObject {
        return ViewModelGetObject(book: featuredBooks[index], isFeatured: true, bookViewModel: bookModel!)
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
