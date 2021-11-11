//
//  ViewController.swift
//  Water Reminder
//
//  Created by Darya on 11/9/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var quickOptionsLabel: UILabel!
    private let options = OptionsViewModel()
    private let consumption = Consumption()
    var wave: WaveAnimationView?
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UINib(nibName: "OptionViewCell", bundle: nil), forCellWithReuseIdentifier: "OptionViewCell")
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.displayAnimatedWater()
        wave?.startAnimation()
        setupCollection()
    }

    override func viewDidDisappear(_ animated: Bool) {
        wave?.stopAnimation()
    }
    
    func setupCollection() {
        self.view.addSubview(collectionView)
        self.collectionView.backgroundColor = .white
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 28, bottom: 0, right: 28)
        collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0).isActive = true
        collectionView.topAnchor.constraint(equalTo: self.quickOptionsLabel.bottomAnchor, constant: 10).isActive = true
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    private func displayAnimatedWater() {
        let maskView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        maskView.backgroundColor = .red
        maskView.layer.cornerRadius = 100
        
        let borderView = UIView(frame: CGRect(x: UIScreen.main.bounds.width / 2 - 105, y: UIScreen.main.bounds.height / 3 - 55, width: 210, height: 210))
        borderView.layer.cornerRadius = 105
        borderView.layer.borderWidth = 2
        borderView.layer.borderColor = UIColor(named: "WaveFront")?.cgColor
        self.view.addSubview(borderView)
        
        self.wave = WaveAnimationView(frame: CGRect(x: UIScreen.main.bounds.width / 2 - 100, y: UIScreen.main.bounds.height / 3 - 50, width: 200, height: 200), progress: Float(consumption.totalTodayPercent()))
        options.fillOptions()
        view.addSubview(self.wave ?? self.view)
        self.wave?.mask = maskView
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    enum CollectionConstants {
        static let numberOfItems = 11
        static let cellCornerRadius = 12
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) ->  CGSize {
        return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CollectionConstants.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
    let cell: OptionViewCell = (collectionView.dequeueReusableCell(withReuseIdentifier: "OptionViewCell", for: indexPath) as? OptionViewCell)!
        cell.name = options.quickOptions[indexPath.item].name
        cell.volume = "\(options.quickOptions[indexPath.item].volume) ml"
        cell.image = options.quickOptions[indexPath.item].image
        cell.layer.shadowRadius = 2
        cell.layer.cornerRadius = CGFloat(CollectionConstants.cellCornerRadius)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.consumption.addRecentItems(item: options.quickOptions[indexPath.item])
    }
}
