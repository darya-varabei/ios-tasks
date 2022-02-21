//
//  Service.swift
//  ImageCollection
//
//  Created by Дарья Воробей on 20.02.22.
//

import Foundation
import UIKit

struct Service {
    
    var numOfImages: Int = 0
    
    init(numOfImages: Int) {
        self.numOfImages = numOfImages
    }
    
    func loadImages(completion: @escaping ([UIImage]) -> Void) {
        var images: [UIImage] = []
        let group = DispatchGroup()
        for _ in 0..<numOfImages {
            guard let url = URL(string: "https://picsum.photos/500/300?random=1") else { fatalError() }
            group.enter()
            URLSession.shared.dataTask(with: url) { data, response, error in
                defer { group.leave() }

                guard let data = data else { return }
                guard let image = UIImage(data: data) else { fatalError() }
                images.append(image)
            }.resume()
        }

        group.notify(queue: .main) {
            completion(images)
        }
    }
}
