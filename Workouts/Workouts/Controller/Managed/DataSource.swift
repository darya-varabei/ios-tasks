//
//  DataSource.swift
//  Workouts
//
//  Created by Дарья Воробей on 2/3/22.
//

import Foundation
import CoreData

enum DataSource {
    case session(Session)
}

extension DataSource {
    init(item: NSManagedObject) {
      if let workout = item as? Session {
            self = .session(workout)
        } else {
            fatalError("\(item) is not a valid mood source")
        }
    }

//    var predicate: NSPredicate {
//        switch self  {
//        case .session(let c):
//            return NSPredicate(format: "exercises in %@", argumentArray: [c.exercises])
//        }
//    }

    var managedObject: NSManagedObject? {
        switch self {
        case .session(let c): return c
        }
    }
}
