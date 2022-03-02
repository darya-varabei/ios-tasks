//
//  OptionViewCell.swift
//  Water Reminder
//
//  Created by Darya on 11/9/21.
//

import UIKit

class OptionViewCell: UICollectionViewCell {

    @IBOutlet private var optionName: UILabel!
    @IBOutlet private var optionVolume: UILabel!
    @IBOutlet private var optionImage: UIImageView!
    private let defaultImage = "watersmall"
    private let cellCornerRadius = 12
    private let cellShadowRadius = 2
    
    var name: String? {
        didSet {
            optionName.text = name
        }
    }
    
    var volume: Int? {
        didSet {
            optionVolume.text = "\(volume ?? 0) ml"
        }
    }
    
    var image: String? {
        didSet {
            optionImage.image = UIImage(named: image ?? defaultImage)
        }
    }
    
    private func setCornerRadius() {
        layer.shadowRadius = CGFloat(cellShadowRadius)
        layer.cornerRadius = CGFloat(cellCornerRadius)
    }
}
