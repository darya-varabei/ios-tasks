//
//  DataSource.swift
//  Workouts
//
//  Created by Дарья Воробей on 2/3/22.
//

import Foundation
import CoreData

enum DataSource {
   // case exercise(Exercise)
    case session(Session)
}

extension DataSource {
    init(item: NSManagedObject) {
       // if let exercise = item as? Exercise {
        //    self = .exercise(exercise)
        /*} else*/ if let workout = item as? Session {
            self = .session(workout)
        } else {
            fatalError("\(item) is not a valid mood source")
        }
    }

    var predicate: NSPredicate {
        switch self  {
//        case .exercise(let c):
//            return NSPredicate(format: "exercise = %@", argumentArray: [c])
        case .session(let c):
            return NSPredicate(format: "exercises in %@", argumentArray: [c.exercises])
        }
    }

    var managedObject: NSManagedObject? {
        switch self {
        //case .exercise(let c): return c
        case .session(let c): return c
        }
    }
}


//extension MoodSource: LocalizedStringConvertible {
//    var localizedDescription: String {
//        switch self  {
//        case .exercise(let c): return c.localizedDescription
//        case .workout(let c): return c.localizedDescription
//        }
//    }
//}
//
