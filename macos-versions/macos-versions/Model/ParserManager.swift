//
//  ParserManager.swift
//  macos-versions
//
//  Created by Дарья Воробей on 1/3/22.
//

import Foundation

class ParserManager {
    
    static var macosVersions: [Version]?
    
    private enum Filename {
        static let macosVersions = "Macos-Versions"
        static let macosXVersions = "MacosX-Versions"
    }
    
    static func loadData(completionHandler: @escaping ([Version]?, Bool?, [Version]?, Bool?) -> Void) {
        
        Parser.loadJSONFile(named: Filename.macosVersions, type: [Version].self) { (versions, error) in
            guard error == nil else {
                completionHandler(nil, false, nil, false)
                return
            }
            
            Parser.loadJSONFile(named: Filename.macosXVersions, type: [Version].self) { (versionsX, error) in
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
