//
//  Rectangle.swift
//  Collection
//
//  Created by Дарья Воробей on 12/25/21.
//

import Foundation
import UIKit

struct Rectangle {
    
    private var height: CGFloat
    private var color: UIColor
    
    init(height: CGFloat, color: UIColor) {
        self.height = height
        self.color = color
    }
    
    func getHeight() -> CGFloat {
        return height
    }
    
    func getColor() -> UIColor {
        return color
    }
   
    mutating func setHeight(newHeight: CGFloat) {
        height = newHeight
    }
    
    mutating func setColor(newColor: UIColor) {
        color = newColor
    }
}
