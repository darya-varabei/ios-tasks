//
//  CategoryCollectionViewCell.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/15/22.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    //var color: Observable<UIColor> = Observable(UIColor.init(white: 1, alpha: 0.1))
    var color: UIColor? {
        didSet {
            layer.backgroundColor = color?.cgColor
        }
    }
    var cellViewModel: CategoryCellViewModel? {
        didSet {
            categoryLabel.text = cellViewModel?.name
    //layer.backgroundColor = color //cellViewModel?.color.cgColor
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellViewModel?.color?.bindAndFire { [self] _ in color = UIColor.white }
        setConstantProperties()
        //layer.backgroundColor = UIColor.clear.cgColor
        //setDefaultAppearance()
        
    }
    
    func setDefaultAppearance() {
        //layer.backgroundColor = color.value.cgColor
    }
    
    func setSelectedPropertyAppearance() {
        layer.backgroundColor = UIColor(named: "semiClearWhite")?.cgColor
    }
    
    func setConstantProperties() {
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = 20
    }
}
