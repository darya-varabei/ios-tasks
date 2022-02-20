//
//  Service.swift
//  ImageCollection
//
//  Created by Дарья Воробей on 20.02.22.
//

import Foundation

struct Service {
    
    var numOfImages: Int = 0
    
    init(numOfImages: Int) {
        self.numOfImages = numOfImages
    }
    
    func loadImages(completion: @escaping ([URL]) -> Void) {
        var imageLinks: [Int: URL] = [:]
        let group = DispatchGroup()
    
        for index in 0..<numOfImages {
            let url = URL(string: "https://random.imagecdn.app/300/300")!
            group.enter()
            URLSession.shared.dataTask(with: url) { data, response, error in
                defer { group.leave() }

                guard let data = data else { return }

                do {
                    let image = try JSONDecoder().decode(RandomImage.self, from: data)
                    imageLinks[index] = image.link
                } catch {
                    print("JSON error: \(error.localizedDescription)")
                }
            }.resume()
        }

        group.notify(queue: .main) {
            let sortedLinks = (0..<numOfImages).compactMap { imageLinks[$0] }
            completion(sortedLinks)
        }
    }
}
