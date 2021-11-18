//
//  DrawingCollectionViewCell.swift
//  Drawings
//
//  Created by Darya on 11/18/21.
//

import UIKit

class DrawingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var drawing: Drawing? {
        didSet {
            image.image = UIImage(named: drawing?.image ?? "")
            label.text = drawing?.title
        }
    }
}
