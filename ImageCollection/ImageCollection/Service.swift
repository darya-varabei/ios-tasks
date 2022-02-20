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
        //var imageLinks: [Int: URL] = [:]
        var images: [UIImage] = []
        let group = DispatchGroup()
    
        for index in 0..<numOfImages {
            let url = URL(string: "https://random.imagecdn.app/500/150")!
            group.enter()
            URLSession.shared.dataTask(with: url) { data, response, error in
                defer { group.leave() }

                guard let data = data else { return }

                do {
                    let image = UIImage(data: data)//try JSONDecoder().decode(RandomImage.self, from: data)
                    images.append(image!)
                    // imageLinks[index] = image.link
                } //catch {
                    //print("JSON error: \(error.localizedDescription)")//
              //  }
            }.resume()
        }

        group.notify(queue: .main) {
            //let sortedLinks = (0..<numOfImages).compactMap { imageLinks[$0] }
            completion(images)
        }
    }
}
