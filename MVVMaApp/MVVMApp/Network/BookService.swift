//
//  BookService.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/16/22.
//

import Foundation
import UIKit

class BookService: BookServiceProtocol {
    let imageCache = NSCache<AnyObject, AnyObject>()
    var books: [Book]?
    var imageView: UIImageView = UIImageView()
    
    private enum Filename {
        static let bookList = "Books"
        static let featuredBookList = "FeaturedBooks"
    }
    
    func loadImage(from url: URL) -> UIImage {
        var task: URLSessionDataTask!
        let queue = DispatchQueue(label: "loadImage")
        //imageView = nil
        //addSpinner()
        if let task = task {
            task.cancel()
        }
        
        if let imageFromCache = imageCache.object(forKey: url.absoluteString as AnyObject) as? UIImage {
            DispatchQueue.main.async {
                self.imageView.image = imageFromCache
            }
            //removeSpinner()
            return self.imageView.image ?? UIImage()
        }
        
        task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            queue.async(flags: .detached) {
                guard let data = data, let newImage = UIImage(data: data) else {
                    return
                }
                self.imageCache.setObject(newImage, forKey: url.absoluteString as AnyObject)
                DispatchQueue.main.async {
                    self.imageView.image = newImage
                    print("Image loaded successfully")
                    //self.removeSpinner()
                }
            }
        }
        task.resume()
        return self.imageView.image ?? UIImage()
    }
    
    func getAllBooks(completion: @escaping ([Book]?, Bool?) -> Void) {
        
        Parser.loadJSONFile(named: Filename.bookList, type: [Book].self) { (models, error) in
            guard error == nil else {
                completion(nil, false)
                return
            }
//
//            Parser.loadJSONFile(named: Filename.macosXVersions, type: [Book].self) { (versionsX, error) in
//                guard error == nil else {
//                    completion(nil, false)
//                    return
//                }
//
                self.books = models ?? []
                completion(models, true)
//            }
        }
    }
}
