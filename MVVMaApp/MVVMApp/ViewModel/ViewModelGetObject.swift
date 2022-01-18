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
    
    init(book: Book) {
        self.book = book
    }
    
    func loadType() -> String {
        return book.title
    }
    
    func loadImage(completion: @escaping(UIImage?) -> Void) {
        let urlString = "https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/ableson.jpg"//book.thumbnailURL!
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else { return }
            let image = UIImage(data: data)
            completion(image)
        }.resume()
    }
}