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
    private var basicWidthConstraint: NSLayoutConstraint?
    private var basicHeightConstraint: NSLayoutConstraint?
    private var heightConstraint: NSLayoutConstraint?
    
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
        basicWidthConstraint = widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 1.5)
        basicWidthConstraint?.isActive = true
        basicWidthConstraint?.priority = .defaultHigh
        layer.cornerRadius = cornerRadius
    }
    
    func setHeightOnCellSelected() {
        basicHeightConstraint = heightAnchor.constraint(equalToConstant: 180)
        basicHeightConstraint?.priority = .defaultHigh
        basicHeightConstraint?.isActive = true
    }
}
