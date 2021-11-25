//
//  Drawing.swift
//  Drawings
//
//  Created by Darya on 11/18/21.
//

import Foundation

class Drawing: Hashable {
    let id = UUID()
    let title: String
    let image: String
    
    init(title: String, image: String) {
        self.title = title
        self.image = image
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    static func == (lhs: Drawing, rhs: Drawing) -> Bool {
        lhs.id == rhs.id
    }
    
    func draw() {
        
    }
}
