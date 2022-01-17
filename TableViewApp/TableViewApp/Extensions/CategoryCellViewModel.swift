//
//  CategoryCellViewModel.swift
//  MVVMApp
//
//  Created by Darya on 1/17/22.
//

import Foundation
import UIKit

struct CategoryCellViewModel {
    
    private var category: Category
    private let maxRGBComponent: CGFloat = 1
    private let alphaComponent: CGFloat = 1.0
    
    init(category: Category) {
        self.category = category
    }
    
    var name: String {
        return category.name
    }
    
    var color: UIColor {
        return generateColor()
    }
    
    private func generateColor() -> UIColor {
        let redValue = CGFloat.random(in: 0...maxRGBComponent)
        let greenValue = CGFloat.random(in: 0...maxRGBComponent)
        let blueValue = CGFloat.random(in: 0...maxRGBComponent)
        
        let randomColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: alphaComponent)
        return randomColor
    }
}
