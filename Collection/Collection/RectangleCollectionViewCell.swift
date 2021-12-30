//
//  RectangleCollectionViewCell.swift
//  Collection
//
//  Created by Дарья Воробей on 12/24/21.
//

import UIKit

class RectangleCollectionViewCell: UICollectionViewCell {
    
    private let cornerRadius: CGFloat = 8
    private let maxRGBComponent: CGFloat = 1
    private let alphaComponent: CGFloat = 1.0
    
    private var cellColor: UIColor? {
        didSet {
            layer.backgroundColor = cellColor?.cgColor
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        changeCellColor()
    }
    
    func getColor() -> UIColor {
        return cellColor ?? UIColor.white
    }
    
    func setFirstColor(initialColor: UIColor) {
        cellColor = initialColor
    }
    
    func changeCellColor() {
        cellColor = generateColor()
        layer.backgroundColor = cellColor?.cgColor
    }
    
    private func generateColor() -> UIColor {
        let redValue = CGFloat.random(in: 0...maxRGBComponent)
        let greenValue = CGFloat.random(in: 0...maxRGBComponent)
        let blueValue = CGFloat.random(in: 0...maxRGBComponent)
        
        let randomColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: alphaComponent)
        return randomColor
    }
}
