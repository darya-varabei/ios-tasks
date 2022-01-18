//
//  CategoryCollectionViewCell.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/15/22.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    
    private enum Literals {
        static let semiClearWhite = "semiClearWhite"
        static let cornerRadius: CGFloat = 20
        static let borderWidth: CGFloat = 2
    }
    
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    
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
        cellViewModel?.color?.bindAndFire { [self] _ in color = UIColor.white }
        setConstantProperties()
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
