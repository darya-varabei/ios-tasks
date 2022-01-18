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
    
    func loadImage(url: String, completion: @escaping(UIImage?) -> Void) {
        let urlString = url
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else { return }
            let image = UIImage(data: data)
            completion(image)
        }.resume()
    }
}
