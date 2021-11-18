//
//  Section.swift
//  Drawings
//
//  Created by Darya on 11/18/21.
//

import Foundation

class Section: Hashable {
    var id = UUID()
    var title: String
    var drawings: [Drawing]
    
    init(title: String, drawings: [Drawing]) {
        self.title = title
        self.drawings = drawings
    }
    
    func hash(into hasher: inout Hasher) {
      hasher.combine(id)
    }
    
    static func == (lhs: Section, rhs: Section) -> Bool {
      lhs.id == rhs.id
    }
}

extension Section {
    static var sections: [Section] = [
        Section(title: "Tree", drawings: [
            Drawing(title: "Tree", image: "Tree")
        ]),
        Section(title: "Face", drawings: [
            Drawing(title: "Face", image: "Face")
        ]),
        Section(title: "Heart", drawings: [
            Drawing(title: "Heart", image: "Heart")
        ]),
        Section(title: "Face", drawings: [
            Drawing(title: "Face", image: "Face")
        ])
    ]
}
