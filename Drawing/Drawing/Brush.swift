//
//  Brush.swift
//  Drawing
//
//  Created by Дарья Воробей on 12/6/21.
//

import Foundation

struct Brush {
    private var color: String = "Black"
    private let strokeWidth = 5
    private let outlineWidth = 5
    
    mutating func setColor(newColor: String) {
        color = newColor
    }
    
    func getColor() -> String {
        return color
    }
    
    func getStrokeWidth() -> Int {
        return strokeWidth
    }
    
    func getOutlineWidth() -> Int {
        return outlineWidth
    }
}
