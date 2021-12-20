//
//  Brush.swift
//  Drawing
//
//  Created by Дарья Воробей on 12/6/21.
//

import Foundation

class Brush {
    private var color: String = "blueberry"
    private let strokeWidth = 5
    private let outlineWidth = 5
    
    public init() {}
    
    func setColor(newColor: String) {
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
