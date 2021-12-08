//
//  ColorCollectionViewCell.swift
//  Drawing
//
//  Created by Дарья Воробей on 12/6/21.
//

import UIKit

class ColorCollectionViewCell: UICollectionViewCell {
    
    var cellColor: String? {
        didSet {
            backgroundColor = UIColor(named: cellColor ?? "blood")
            layer.borderColor = UIColor.white.cgColor
            layer.cornerRadius = 10
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func getSelected() {
        layer.borderWidth = 8
    }
    
    func getDeselected() {
        layer.borderWidth = 0
    }
}
