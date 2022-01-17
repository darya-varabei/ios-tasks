//
//  BookCollectionViewCell.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/14/22.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private var bookImage: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var authorLabel: UILabel!
    
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }

    var cellViewModel: BookCellViewModel? {
        didSet {
            bookImage.image = cellViewModel?.image
            nameLabel.text = cellViewModel?.title
            authorLabel.text = cellViewModel?.author
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
