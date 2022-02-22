//
//  PhotoItemViewModel.swift
//  ImageCollection
//
//  Created by Дарья Воробей on 21.02.22.
//

import Foundation
import UIKit
import CoreData

class PhotoItemViewModel {
    
    static private let numberOfImages = 30
    private let service = Service(numOfImages: numberOfImages)
    private let coreDataService = CoreDataService()
    private let dispatchGroup = DispatchGroup()
    private var fetchedResultsController: NSFetchedResultsController<Photo>?
    private var images = Observable<[UIImage]>()
    
    func loadImages() {
        images.value = []
        service.loadImages (completion: { [weak self] loadedImages in
            self?.images.value = loadedImages
        }, group: dispatchGroup)
    }
    
    func loadFromStorage() {
        fetchedResultsController = coreDataService.createRequest()
        try? fetchedResultsController?.performFetch()
    }
    
    func getObject(at indexPath: IndexPath) -> Photo? {
        return fetchedResultsController?.object(at: indexPath)
    }
    
    func getImages() -> Observable<[UIImage]> {
        return images
    }
    
    func changeState(newState: Bool) {
        service.toggleLoadingState(newState: newState)
    }
}
