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
    
    private let defaultImageUrl = "https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/ableson.jpg"
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    
    var cellViewModel: BookCellViewModel? {
        didSet {
            nameLabel.text = cellViewModel?.title
            authorLabel.text = cellViewModel?.author
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(viewModelGetObject: ViewModelGetObject?) {
        self.nameLabel.text = viewModelGetObject?.loadType()
        viewModelGetObject?.loadImage(url: cellViewModel?.thumbnail ?? defaultImageUrl) { (image) in
            DispatchQueue.main.async {
                self.bookImage.image = image
            }
        }
    }
}
