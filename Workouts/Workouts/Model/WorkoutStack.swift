//
//  WorkoutStack.swift
//  Workouts
//
//  Created by Дарья Воробей on 1/31/22.
//

import Foundation
import CoreData

func createMoodyContainer(completion: @escaping (NSPersistentContainer) -> ()) {
    let container = NSPersistentContainer(name: "Model")
    container.loadPersistentStores { _, error in
        guard error == nil else { fatalError("Failed to load store: \(error!)") }
        DispatchQueue.main.async { completion(container) }
    }
}
