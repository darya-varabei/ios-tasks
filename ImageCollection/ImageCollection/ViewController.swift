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
    
    static private let numberOfImages = 30
    private let collectionCellIdentifier = "PhotoCollectionViewCell"
    private let service = Service(numOfImages: numberOfImages)
    private var images: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        getImages()
    }
    
    private func setupCollectionView() {
        imagesCollectionView.delegate = self
        imagesCollectionView.dataSource = self
        imagesCollectionView.register(UINib(nibName: collectionCellIdentifier, bundle: nil), forCellWithReuseIdentifier: collectionCellIdentifier)
    }
    
    private func getImages() {
        service.loadImages { [weak self] loadedImages in
            self?.images = loadedImages
            self?.imagesCollectionView.reloadData()
        }
    }
    
    @IBAction private func reloadImages(_ sender: Any) {
        getImages()
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: PhotoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellIdentifier, for: indexPath) as? PhotoCollectionViewCell else { return PhotoCollectionViewCell() }
        cell.getImage(newImage: images[indexPath.item])
        return cell
    }
}
