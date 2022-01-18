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
    
    var cellViewModel: BookCellViewModel? {
        didSet {
            guard let countPages = cellViewModel?.numOfPages else { return }
            numOfPagesLabel.text = "\(countPages)"
            overviewTextView.text = cellViewModel?.overview
            
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overviewTextView.backgroundColor = UIColor.clear
        addToBookmarkButton.layer.cornerRadius = 20
        view.backgroundColor = UIColor(named: "darkGradientTop")
    }
    
    func configure(viewModelGetObject: ViewModelGetObject?) {
            viewModelGetObject?.loadImage { (image) in
                DispatchQueue.main.async {
                    self.bookImage.image = image
                }
            }
        }
}
