//
//  ViewController.swift
//  Water Reminder
//
//  Created by Darya on 11/9/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var quickOptionsLabel: UILabel!
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
       
        self.wave = WaveAnimationView(frame: CGRect(x: UIScreen.main.bounds.width / 2 - 100, y: UIScreen.main.bounds.height / 3 - 100, width: 200, height: 200))
        view.addSubview(self.wave ?? self.view)
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
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    enum CollectionConstants {
        static let numberOfItems = 11
        static let cellCornerRadius = 12
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) ->  CGSize {
        return CGSize(width: collectionView.frame.width / 2.5, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CollectionConstants.numberOfItems;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
    let cell : OptionViewCell = (collectionView.dequeueReusableCell(withReuseIdentifier: "OptionViewCell", for: indexPath) as? OptionViewCell)!
        cell.name = "name"
        cell.volume = "volume"
        
        cell.layer.cornerRadius = CGFloat(CollectionConstants.cellCornerRadius)
        return cell
    }
}
