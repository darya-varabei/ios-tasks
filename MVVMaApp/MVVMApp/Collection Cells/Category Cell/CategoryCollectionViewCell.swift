//
//  CategoryCollectionViewCell.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/15/22.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet private var categoryLabel: UILabel!
    
    private let borderWidth: CGFloat = 2
    
    private var color: UIColor? {
        didSet {
            layer.backgroundColor = color?.cgColor
        }
    }
    var cellViewModel: CategoryCellViewModel? {
        didSet {
            categoryLabel.text = cellViewModel?.name
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setConstantProperties()
    }
    
    private func setConstantProperties() {
        layer.borderWidth = borderWidth
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = bounds.height / 2
    }
}
