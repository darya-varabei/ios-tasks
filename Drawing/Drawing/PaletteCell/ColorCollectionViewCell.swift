//
//  ColorCollectionViewCell.swift
//  Drawing
//
//  Created by Дарья Воробей on 12/6/21.
//

import UIKit

class ColorCollectionViewCell: UICollectionViewCell {
    
    private enum CellParameters {
        static let cornerRadius: CGFloat = 10
        static let selectedWidth: CGFloat = 8
        static let unselectedWidth: CGFloat = 0
        static let defaultColor = "blood"
    }
    
    var cellColor: String? {
        didSet {
            backgroundColor = UIColor(named: cellColor ?? CellParameters.defaultColor)
            layer.borderColor = UIColor.white.cgColor
            layer.cornerRadius = CellParameters.cornerRadius
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func getSelected() {
        layer.borderWidth = CellParameters.selectedWidth
    }
    
    func getDeselected() {
        layer.borderWidth = CellParameters.unselectedWidth
    }
}
