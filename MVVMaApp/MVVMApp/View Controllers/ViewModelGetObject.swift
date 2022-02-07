//
//  ViewModelGetObject.swift
//  MVVMApp
//
//  Created by Darya on 1/18/22.
//

import Foundation
import UIKit

struct ViewModelGetObject {
    
    private let book: Book
    private unowned let bookViewModel: BookViewModel
    private var isFeatured: Bool
    
    init(book: Book?, isFeatured: Bool, bookViewModel: BookViewModel) {
        self.book = book!
        self.isFeatured = isFeatured
        self.bookViewModel = bookViewModel
    }
    
    func setIfFeatured() -> Bool {
        return isFeatured
    }
    
    mutating func toggleFeaturedState() {
        isFeatured.toggle()
    }
    
    func loadImage(url: String, completion: @escaping(UIImage?) -> Void) {
        let urlString = url
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else { return }
            let image = UIImage(data: data)
            completion(image)
        }.resume()
    }
    
    func updateFeaturedIndexes(isbn: String, setFeatured: Bool) {
        
        var indexes: [String] = []
        var featuredIsbn = bookViewModel.getFeaturedIsbn()
        for index in bookViewModel.getFeaturedIsbn() {
            indexes.append(index.isbn)
        }
        switch(setFeatured) {
        
        case true, !indexes.contains(isbn):
            featuredIsbn.append(Identifier(isbn: isbn))
            break
            
        case false, indexes.contains(isbn):
            for index in 0..<bookViewModel.getFeaturedIsbn().count {
                if bookViewModel.getFeaturedIsbn()[index].isbn == isbn {
                    featuredIsbn.remove(at: index)
                    break
                }
            }
           
            bookViewModel.modifyIndexesFile(items: featuredIsbn)
            break
            
        default:
            break
        }
    }
    
    func resetToRoot() {
        bookViewModel.getViewControllerDelegate()?.resetToRoot(animated: true)
    }
    
    func getBookViewModel() -> BookViewModel {
        return bookViewModel
    }
}
