//
//  Service.swift
//  ImageCollection
//
//  Created by Дарья Воробей on 20.02.22.
//

import Foundation
import UIKit

struct Service {
    
    private let imageURL = "https://picsum.photos/250/500?random=1"
    private var numOfImages: Int
    private var isLoading = Observable<Bool>()
    
    init(numOfImages: Int) {
        self.numOfImages = numOfImages
    }
    
    func loadImages(completion: @escaping ([UIImage]) -> Void, group: DispatchGroup) {
        var images: [UIImage] = []
        for _ in 0..<numOfImages {
            guard let url = URL(string: imageURL) else { fatalError() }
            group.enter()
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                defer { group.leave() }

                guard let data = data, let image = UIImage(data: data) else { return }
                images.append(image)
            }.resume()
        }

        group.notify(queue: .main) {
            completion(images)
        }
    }
    
    func toggleLoadingState(newState: Bool) {
        isLoading.value? = newState
    }
}
