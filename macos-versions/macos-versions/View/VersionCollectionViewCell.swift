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
        layer.cornerRadius = 15
    }
}
