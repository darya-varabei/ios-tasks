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
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
