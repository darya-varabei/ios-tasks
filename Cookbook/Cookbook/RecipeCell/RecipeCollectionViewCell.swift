//
//  RecipeCollectionViewCell.swift
//  Cookbook
//
//  Created by Darya on 10/18/21.
//

import UIKit

class RecipeCollectionViewCell: UICollectionViewCell {

    //@IBOutlet weak var backgroundImage: BackgroundImageView!
    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var preparationTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.layer.cornerRadius = 15
        // Initialization code
    }

}
