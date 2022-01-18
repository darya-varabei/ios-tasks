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
    
    private enum Literals {
        static let dateStrinOffset = 10
        static let darkGradientTop = "darkGradientTop"
        static let opaqueDarkTop = "opaqueDarkTop"
        static let defaultImageURL = "https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/ableson.jpg"
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
            dateReleasedLabel.text = cellViewModel?.publishedDate.date.substring(to: Literals.dateStrinOffset)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overviewTextView.backgroundColor = UIColor.clear
        addToBookmarkButton.layer.cornerRadius = Literals.buttonCornerRadius
        view.backgroundColor = UIColor(named: Literals.darkGradientTop)
    }
    
    private func setupImageBlurColor() {
        let gradient = CAGradientLayer()
        
        guard let top = UIColor(named: Literals.opaqueDarkTop)?.cgColor else { return }
        guard let bottom = UIColor(named: Literals.darkGradientTop)?.cgColor else { return }
        gradient.frame = view.bounds
        gradient.colors = [top, bottom]
        gradient.frame = bookImage.frame
        imageBlurView.layer.insertSublayer(gradient, at: 0)
    }
    
    func configure(viewModelGetObject: ViewModelGetObject?) {
        viewModelGetObject?.loadImage(url: cellViewModel?.thumbnail ?? Literals.defaultImageURL) { (image) in
            DispatchQueue.main.async {
                self.bookImage.image = image
            }
        }
    }
}
