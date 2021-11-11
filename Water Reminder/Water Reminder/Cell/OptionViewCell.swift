//
//  OptionViewCell.swift
//  Water Reminder
//
//  Created by Darya on 11/9/21.
//

import UIKit

class OptionViewCell: UICollectionViewCell {

    @IBOutlet weak var optionName: UILabel!
    @IBOutlet weak var optionVolume: UILabel!
    @IBOutlet weak var optionImage: UIImageView!
    
    var name: String? {
        didSet {
            self.optionName.text = name
        }
    }
    
    var volume: String? {
        didSet {
            self.optionVolume.text = volume
        }
    }
    
    var image: String? {
        didSet {
            self.optionImage.image = UIImage(named: image ?? "watersmall")
        }
    }
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }
}
