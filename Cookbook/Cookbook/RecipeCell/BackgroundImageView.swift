//
//  BackgroundImageView.swift
//  Cookbook
//
//  Created by Darya on 10/19/21.
//

import Foundation
import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

class BackgroundImageView: UIImageView {
    
    var task: URLSessionDataTask!
    let spinner = UIActivityIndicatorView(style: .medium)
    
    func loadImage(from url: URL) {
        
       // image = nil
        addSpinner()
        if let task = task {
            task.cancel()
        }
        
        if let imageFromCache = imageCache.object(forKey: url.absoluteString as AnyObject) as? UIImage {
            self.image = imageFromCache
            removeSpinner()
            return
        }
        
        task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, let newImage = UIImage(data: data) else {
                return
            }
            
            imageCache.setObject(newImage, forKey: url.absoluteString as AnyObject)
            DispatchQueue.main.async {
                self.image = newImage
                self.removeSpinner()
            }
        }
        task.resume()
    }
    
    private func addSpinner() {
        addSubview(spinner)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        spinner.startAnimating()
    }
    
    private func removeSpinner() {
        spinner.removeFromSuperview()
    }
}
