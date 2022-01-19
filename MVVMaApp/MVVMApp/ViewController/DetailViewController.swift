//
//  DetailViewController.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/15/22.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet private var bookImage: UIImageView!
    @IBOutlet private var addToBookmarkButton: UIButton!
    @IBOutlet private var numOfPagesLabel: UILabel!
    @IBOutlet private var dateReleasedLabel: UILabel!
    @IBOutlet private var overviewTextView: UITextView!
    @IBOutlet private var imageBlurView: UIView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var authorsLabel: UILabel!
    
    private enum DetailViewLiterals {
        static let dateStrinOffset = 10
        static let darkGradientTop = "darkGradientTop"
        static let opaqueDarkTop = "opaqueDarkTop"
        static let buttonCornerRadius: CGFloat = 20
    }
    
    var cellViewModel: BookCellViewModel? {
        didSet {
            guard let countPages = cellViewModel?.numOfPages else { return }
            numOfPagesLabel.text = "\(countPages)"
            overviewTextView.text = cellViewModel?.overview
            setupImageBlurColor()
            titleLabel.text = cellViewModel?.title
            authorsLabel.text = cellViewModel?.author
            dateReleasedLabel.text = cellViewModel?.publishedDate.date.substring(to: DetailViewLiterals.dateStrinOffset)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overviewTextView.backgroundColor = UIColor.clear
        addToBookmarkButton.layer.cornerRadius = DetailViewLiterals.buttonCornerRadius
        view.backgroundColor = UIColor(named: DetailViewLiterals.darkGradientTop)
    }
    
    func configure(viewModelGetObject: ViewModelGetObject?) {
        guard let thumbnail = cellViewModel?.thumbnail else { return }
        viewModelGetObject?.loadImage(url: thumbnail) { (image) in
            DispatchQueue.main.async {
                self.bookImage.image = image
            }
        }
        
        guard let isFeatured = viewModelGetObject?.setIfFeatured() else { return  }
        if isFeatured {
            addToBookmarkButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
        }
    }
    
    private func setupImageBlurColor() {
        let gradient = CAGradientLayer()
        
        guard let top = UIColor(named: DetailViewLiterals.opaqueDarkTop)?.cgColor else { return }
        guard let bottom = UIColor(named: DetailViewLiterals.darkGradientTop)?.cgColor else { return }
        gradient.frame = view.bounds
        gradient.colors = [top, bottom]
        gradient.frame = bookImage.frame
        imageBlurView.layer.insertSublayer(gradient, at: 0)
    }
    
    @IBAction private func addBookToFeatured(_ sender: Any) {
    }
}
