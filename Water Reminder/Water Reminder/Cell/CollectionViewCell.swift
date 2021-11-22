//
//  CollectionViewCell.swift
//  Water Reminder
//
//  Created by Darya on 11/12/21.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var returnImage: UIImageView!
    private let systemImage = "arrowshape.turn.up.backward"
    
    var image: String? {
        didSet {
            self.returnImage.image = UIImage(systemName: systemImage)
        }
    }
}
