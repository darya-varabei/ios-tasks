//
//  Workout.swift
//  Workouts
//
//  Created by Дарья Воробей on 1/31/22.
//

import Foundation
import CoreData

final class Session: NSManagedObject {
    @NSManaged fileprivate(set) var name: String
    @NSManaged fileprivate(set) var time: Date
    @NSManaged fileprivate(set) var info: String
    @NSManaged fileprivate(set) var type: String
    @NSManaged fileprivate(set) var coach: String
    @NSManaged fileprivate(set) var id: Int64
    
    public static func insert(into context: NSManagedObjectContext, name: String, time: Date, typeOfClass: String, info: String, coach: String) -> Session {
        let workout: Session = context.insertObject()
        workout.name = name
        workout.time = Date()
        workout.type = typeOfClass
        workout.info = info
        workout.coach = coach
        return workout
    }
    
    public static func update(into context: NSManagedObjectContext, object: Session, name: String, time: Date, typeOfClass: String, info: String, coach: String) -> Session {
        object.setValue(name, forKey: "name")
        object.setValue(time, forKey: "time")
        object.setValue(typeOfClass, forKey: "type")
        object.setValue(info, forKey: "info")
        object.setValue(coach, forKey: "coach")
        return object
    }
    
    static func delete(session: Session) {
        session.managedObjectContext?.performChanges {
            session.managedObjectContext?.delete(session)
        }
    }
    
    public override func willSave() {
        super.willSave()
        
        if self.id == 0 {
            setPrimitiveValue(getAutoIncrement(), forKey: "id")
        }
    }
    
    func getAutoIncrement() -> Int64   {
        let url = self.objectID.uriRepresentation()
        let urlString = url.absoluteString
        if let pN = urlString.components(separatedBy: "/").last {
            let numberPart = pN.replacingOccurrences(of: "p", with: "")
            if let number = Int64(numberPart) {
                return number
            }
        }
        return 0
    }
}

extension Session: Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(name), ascending: false)]
    }
}
