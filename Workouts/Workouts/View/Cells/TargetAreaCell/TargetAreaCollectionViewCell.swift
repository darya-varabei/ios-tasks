//
//  TargetAreaCollectionViewCell.swift
//  Workouts
//
//  Created by Дарья Воробей on 1/31/22.
//

import UIKit

class TargetAreaCollectionViewCell: UICollectionViewCell {

    @IBOutlet private var targetAreaLabel: UILabel!
    private let selectedCellColor = "selectedCellColor"
    private let cornerRadius: CGFloat = 15
    private let borderWidth: CGFloat = 1
    
    var isBeingSelected = false {
        didSet {
            if isBeingSelected {
                backgroundColor = UIColor(named: selectedCellColor)
            }
            else {
                backgroundColor = UIColor.white
            }
        }
    }
    var targetText: String? {
        didSet {
            targetAreaLabel.text = targetText
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCellAppeatance()
    }
    
    func toggleCellColor() {
        isBeingSelected.toggle()
        if isBeingSelected {
            backgroundColor = UIColor(named: selectedCellColor)
        }
        else {
            backgroundColor = UIColor.white
        }
    }
    
    private func setupCellAppeatance() {
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = UIColor(named: selectedCellColor)?.cgColor
    }
}
