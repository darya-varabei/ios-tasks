//
//  RecipeCollectionViewCell.swift
//  Cookbook
//
//  Created by Darya on 10/18/21.
//

import UIKit

class RecipeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backgroundImage: BackgroundImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var preparationTime: UILabel!
    @IBOutlet weak var bluringRectangle: UIImageView!
    @IBOutlet weak var loadIndicator: UIActivityIndicatorView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.layer.cornerRadius = 15
        
        DispatchQueue.main.async {
            self.loadIndicator.startAnimating()
        }
    }
}
