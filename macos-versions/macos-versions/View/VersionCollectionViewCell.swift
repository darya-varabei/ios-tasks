//
//  VersionCollectionViewCell.swift
//  macos-versions
//
//  Created by Дарья Воробей on 1/3/22.
//

import UIKit

class VersionCollectionViewCell: UICollectionViewCell {

    @IBOutlet private var versionLabel: UILabel!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var versionImage: UIImageView!
    
    private let cornerRadius: CGFloat = 15
    private let basicCellWidth: CGFloat = 220
    private let basicCellHeight: CGFloat = 180
    private var basicWidthConstraint: NSLayoutConstraint?
    private var basicHeightConstraint: NSLayoutConstraint?
    
    func setVersionLabelText(version: String) {
        versionLabel.text = version
    }

    func setNameLabelText(name: String) {
        nameLabel.text = name
    }
    
    func setVersionImage(image: String) {
        versionImage.image = UIImage(named: image)
    }
    
    func setCellWidth() {
        translatesAutoresizingMaskIntoConstraints = true
        basicWidthConstraint = widthAnchor.constraint(equalToConstant: basicCellWidth)
        basicWidthConstraint?.isActive = true
        basicWidthConstraint?.priority = .defaultHigh
        layer.cornerRadius = cornerRadius
    }
    
    func setCellHeight() {
        basicHeightConstraint = heightAnchor.constraint(equalToConstant: basicCellHeight)
        basicHeightConstraint?.priority = .defaultHigh
        basicHeightConstraint?.isActive = true
    }
}
