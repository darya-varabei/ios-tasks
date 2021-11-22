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
    
    var name: String? {
        didSet {
            optionName.text = name
        }
    }
    
    var volume: String? {
        didSet {
            optionVolume.text = volume
        }
    }
    
    var image: String? {
        didSet {
            optionImage.image = UIImage(named: image ?? defaultImage)
        }
    }
}
