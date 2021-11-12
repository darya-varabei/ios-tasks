//
//  CollectionViewCell.swift
//  Water Reminder
//
//  Created by Darya on 11/12/21.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var returnImage: UIImageView!
    
    var image: String? {
        didSet {
            self.returnImage.image = UIImage(systemName: "arrowshape.turn.up.backward")
        }
    }
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }
}
