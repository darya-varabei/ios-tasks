//
//  ViewController.swift
//  ImageCollection
//
//  Created by Дарья Воробей on 20.02.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private var imagesCollectionView: UICollectionView!
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    private let service = Service(numOfImages: 30)
    var imageURLs: [URL]?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        service.loadImages { [weak self] imageURLs in
                self?.imageURLs = imageURLs
                self?.imagesCollectionView.reloadData()
            }
    }
    
    private func setupCollectionView() {
        imagesCollectionView.delegate = self
        imagesCollectionView.dataSource = self
        imagesCollectionView.register(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PhotoCollectionViewCell")
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: PhotoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as? PhotoCollectionViewCell else { fatalError("error") }
        cell.getImage()
        return UICollectionViewCell()
    }
}
