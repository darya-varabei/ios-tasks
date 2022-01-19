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
    
    init(book: Book, isFeatured: Bool) {
        self.book = book
        self.isFeatured = isFeatured
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
}
