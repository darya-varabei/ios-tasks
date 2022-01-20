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
    private var isFeatured: Bool
    private unowned let bookViewModel: BookViewModel
    
    init(book: Book, isFeatured: Bool, bookViewModel: BookViewModel) {
        self.book = book
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
        var array = bookViewModel.featuredIsbn
        for i in bookViewModel.featuredIsbn {
            indexes.append(i.isbn)
        }
        switch(setFeatured){
        
        case true, !indexes.contains(isbn):
            array.append(Identifier(isbn: isbn))
            break
            
        case false, indexes.contains(isbn):
            for i in 0..<bookViewModel.featuredIsbn.count {
                if bookViewModel.featuredIsbn[i].isbn == isbn {
                    array.remove(at: i)
                    break
                }
            }
           
            bookViewModel.modifyIndexesFile(items: array)
            
            break
            
        default:
            break
        }
    }
}
