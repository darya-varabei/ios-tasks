//
//  CategoryCollectionViewCell.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/15/22.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet private var categoryLabel: UILabel!
    
    private enum Literals {
        static let semiClearWhite = "semiClearWhite"
        static let cornerRadius: CGFloat = 20
        static let borderWidth: CGFloat = 2
    }
    
    var color: UIColor? {
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
    
    func bindColor() {
        cellViewModel?.isSelected.bind { [weak self] isSelected in
            if isSelected {
                self?.color = UIColor(named: Literals.semiClearWhite)
            }
            else {
                self?.color = UIColor.clear
            }
        }
    }
    
    func setDefaultAppearance() {
        
    }
    
    func setSelectedPropertyAppearance() {
        layer.backgroundColor = UIColor(named: Literals.semiClearWhite)?.cgColor
    }
    
    func setConstantProperties() {
        layer.borderWidth = Literals.borderWidth
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = Literals.cornerRadius
    }
}
