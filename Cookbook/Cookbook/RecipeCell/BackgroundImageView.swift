//
//  BackgroundImageView.swift
//  Cookbook
//
//  Created by Darya on 10/19/21.
//

import Foundation
import UIKit

class BackgroundImageView: UIImageView {
    
    var task: URLSessionTask!
    
    func loadImage(from url: URL) {
        
        image = nil
        task.cancel()
        task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            
            guard let data = data, let newImage = UIImage(data: data) else {
                return
            }
            
            DispatchQueue.main.async {
                self.image = newImage
            }
        }
        task.resume()
    }
}
