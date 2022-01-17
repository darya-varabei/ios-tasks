//
//  BookCollectionViewCell.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/14/22.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }

    var cellViewModel: BookCellViewModel? {
        didSet {
            bookImage.image = UIImage(named: cellViewModel!.image)
            nameLabel.text = cellViewModel?.title
            authorLabel.text = cellViewModel?.author
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
