//
//  ImageLoader.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 2/8/22.
//

import Foundation
import UIKit

class ImageLoader {
    
    static func loadImage(url: String, completion: @escaping(UIImage?) -> Void) {
        let urlString = url
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else { return }
            let image = UIImage(data: data)
            completion(image)
        }.resume()
    }
    
}
