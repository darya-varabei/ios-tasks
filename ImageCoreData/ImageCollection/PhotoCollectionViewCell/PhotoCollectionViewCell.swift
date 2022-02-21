//
//  PhotoCollectionViewCell.swift
//  ImageCollection
//
//  Created by Дарья Воробей on 20.02.22.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private var photo: UIImageView!

    func getImage(newImage: UIImage) {
        photo.image = newImage
    }
}
