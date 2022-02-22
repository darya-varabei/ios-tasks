//
//  Photo.swift
//  ImageCollection
//
//  Created by Дарья Воробей on 22.02.22.
//

import Foundation
import CoreData

final class Photo: NSManagedObject {
    @NSManaged fileprivate(set) var image: Data
    
    public static func insert(into context: NSManagedObjectContext, newImage: Data) -> Photo {
        let photo: Photo = context.insertObject()
        photo.image = newImage
        return photo
    }
    
    static func delete(image: Photo) {
        image.managedObjectContext?.performChanges {
            image.managedObjectContext?.delete(image)
        }
    }
}

extension Photo: Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(image), ascending: false)]
    }
}
