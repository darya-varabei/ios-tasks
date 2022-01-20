//
//  BookCollectionViewCell.swiftViewCell {
    
    @IBOutlet private var bookImage: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var authorLabel: UILabel!
    
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
        guard let thumbnail = cellViewModel?.thumbnail else { return }
        viewModelGetObject?.loadImage(url: thumbnail) { (image) in
            DispatchQueue.main.async {
                self.bookImage.image = image
            }
        }
    }
}
