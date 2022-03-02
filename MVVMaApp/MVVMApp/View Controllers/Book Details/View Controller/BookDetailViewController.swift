//
//  BookDetailViewController.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/24/22.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    @IBOutlet private var bookImage: UIImageView!
    @IBOutlet private var addToBookmarkButton: UIButton!
    @IBOutlet private var numOfPagesLabel: UILabel!
    @IBOutlet private var dateReleasedLabel: UILabel!
    @IBOutlet private var overviewTextView: UITextView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var authorsLabel: UILabel!
    
    private enum DetailViewLiterals {
        static let dateStrinOffset = 10
        static let darkGradientTop = "darkGradientTop"
        static let opaqueDarkTop = "opaqueDarkTop"
        static let buttonCornerRadius: CGFloat = 20
        static let featuredBookmark = "bookmark.fill"
        static let unfeaturedBookmark = "bookmark"
        static let backButtonTitle = "Back"
    }
    
    private var viewModelObject: BookDetailViewModel?
    private var cellViewModel: BookCellViewModel?
    
    init(cellViewModel: BookCellViewModel?, viewModelObject: BookDetailViewModel?) {
        super.init(nibName: nil, bundle: nil)
        self.cellViewModel = cellViewModel
        self.viewModelObject = viewModelObject
    }
    
    required init?(coder: NSCoder) {
        fatalError(Literals.errorInitMessage)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overviewTextView.backgroundColor = UIColor.clear
        addToBookmarkButton.layer.cornerRadius = DetailViewLiterals.buttonCornerRadius
        view.backgroundColor = UIColor(named: DetailViewLiterals.darkGradientTop)
        setupBackButton()
    }
    
    override func viewDidLayoutSubviews() {
        configure(viewModelGetObject: viewModelObject)
        getInformationFromModel()
    }
    
    private func configure(viewModelGetObject: BookDetailViewModel?) {
        viewModelObject = viewModelGetObject
        guard let thumbnail = cellViewModel?.thumbnail else { return }
        ImageLoader.loadImage(url: thumbnail) { (image) in
            DispatchQueue.main.async {
                self.bookImage.image = image
            }
        }
        
        guard let isFeatured = viewModelGetObject?.setIfFeatured() else { return }
        if isFeatured {
            addToBookmarkButton.setImage(UIImage(systemName: DetailViewLiterals.featuredBookmark), for: .normal)
        }
    }
    
    private func getInformationFromModel() {
        guard let countPages = cellViewModel?.numOfPages else { return }
        numOfPagesLabel.text = "\(countPages)"
        overviewTextView.text = cellViewModel?.overview
        titleLabel.text = cellViewModel?.title
        authorsLabel.text = cellViewModel?.author
        dateReleasedLabel.text = cellViewModel?.publishedDate.date.substring(to: DetailViewLiterals.dateStrinOffset)
    }
    
    private func setupBackButton() {
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: DetailViewLiterals.backButtonTitle, style: UIBarButtonItem.Style.plain, target: self, action: #selector(backButtonTap))
        self.navigationItem.leftBarButtonItem = newBackButton
    }
    
    @objc private func backButtonTap() {
        viewModelObject?.updateFeaturedIndexes(isbn: cellViewModel?.isbn ?? "-", setFeatured: viewModelObject?.setIfFeatured() ?? false)
        viewModelObject?.getBookViewModel()?.resetToRoot!()
    }
    
    @IBAction private func addBookToFeatured(_ sender: Any) {
        guard let isFeatured = viewModelObject?.setIfFeatured() else { return }
        if isFeatured {
            addToBookmarkButton.setImage(UIImage(systemName: DetailViewLiterals.unfeaturedBookmark), for: .normal)
        }
        else {
            addToBookmarkButton.setImage(UIImage(systemName: DetailViewLiterals.featuredBookmark), for: .normal)
        }
        viewModelObject?.toggleFeaturedState()
    }
}
