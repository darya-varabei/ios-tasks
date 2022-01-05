//
//  ParserManager.swift
//  macos-versions
//
//  Created by Дарья Воробей on 1/3/22.
//

import Foundation

class ParserManager {
    
    static var macosVersions: [Version]?
    
    static func loadData(completionHandler: @escaping ([Version]?, Bool?, [Version]?, Bool?) -> Void) {
        
        Parser.loadJSONFile(named: "Macos-Versions", type: [Version].self) { (versions, error) in
            guard error == nil else {
                completionHandler(nil, false, nil, false)
                return
            }
            
            Parser.loadJSONFile(named: "MacosX-Versions", type: [Version].self) { (versionsX, error) in
                guard error == nil else {
                    completionHandler(nil, false, nil, false)
                    return
                }
                
                self.macosVersions = versions ?? []
                completionHandler(versions, true, versionsX, true)
            }
        }
    }
}
