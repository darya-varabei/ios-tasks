//
//  ParserManager.swift
//  macos-versions
//
//  Created by Дарья Воробей on 1/3/22.
//

import Foundation

class ParserManager {
    
    var macosVersions: [Version]?
    
    func loadData(completionHandler: @escaping (Version?, Bool?) -> Void) {
        Parser.loadJSONFile(named: "Macos-Versions", type: [Version].self) { [weak self] (versions, error) in
            guard error == nil else {
                completionHandler(nil, false)
                return
            }
            self?.macosVersions = versions ?? []
        }
    }
}
