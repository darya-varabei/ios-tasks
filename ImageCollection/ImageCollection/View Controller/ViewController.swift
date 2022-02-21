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
   
    private let viewModel = PhotoItemViewModel()
    private let collectionCellIdentifier = "PhotoCollectionViewCell"
    
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
        viewModel.loadImages()
        viewModel.getImages().bind(observer: {_ in
            DispatchQueue.main.async { [weak self] in
                self?.imagesCollectionView.reloadData()
            }
        })
    }
    
    @IBAction private func reloadImages(_ sender: Any) {
        getImages()
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getImages().value?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: PhotoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellIdentifier, for: indexPath) as? PhotoCollectionViewCell, let image = viewModel.getImages().value?[indexPath.item] else { return PhotoCollectionViewCell() }
        cell.getImage(newImage: image)
        return cell
    }
}
