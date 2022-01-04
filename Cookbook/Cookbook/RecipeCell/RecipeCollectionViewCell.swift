//
//  RecipeCollectionViewCell.swift
//  Cookbook
//
//  Created by Darya on 10/18/21.
//

import UIKit

class RecipeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var backgroundImage: BackgroundImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var preparationTime: UILabel!
    @IBOutlet var bluringRectangle: UIImageView!
    @IBOutlet var loadIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.layer.cornerRadius = 15
    }
}
