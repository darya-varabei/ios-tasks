//
//  PhotoItemViewModel.swift
//  ImageCollection
//
//  Created by Дарья Воробей on 21.02.22.
//

import Foundation
import UIKit

class PhotoItemViewModel {
    
    static private let numberOfImages = 30
    private let service = Service(numOfImages: numberOfImages)
    private var images = Observable<[UIImage]>()
    
    func loadImages() {
        images.value = []
        service.loadImages { [weak self] loadedImages in
            self?.images.value = loadedImages
        }
    }
    
    func getImages() -> Observable<[UIImage]> {
        return images
    }
}
