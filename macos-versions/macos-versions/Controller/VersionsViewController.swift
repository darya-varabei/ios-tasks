//
//  ViewController.swift
//  macos-versions
//
//  Created by Дарья Воробей on 1/3/22.
//

import UIKit

class VersionsViewController: UIViewController {
    
    @IBOutlet private var versionsCollectionView: UICollectionView!
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    
    private enum CollectionParameters {
        static let cellIdentifier = "VersionCollectionViewCell"
        static let controllerToOpenIdentifier = "DetailViewController"
    }
    
    private let parserManager = ParserManager()
    
    private var macosVersions: [Version] = [] {
        didSet {
            DispatchQueue.main.async {
                self.versionsCollectionView.reloadData()
                self.activityIndicator.stopAnimating()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.color = UIColor.white
        activityIndicator.startAnimating()
        DispatchQueue.global(qos: .background).async {
            self.fetchData()
        }
    }
    
    private func setupCollection() {
        versionsCollectionView.delegate = self
        versionsCollectionView.dataSource = self
        versionsCollectionView.register(UINib(nibName: CollectionParameters.cellIdentifier, bundle: nil), forCellWithReuseIdentifier: CollectionParameters.cellIdentifier)
    }

    private func fetchData() {
        ParserManager.loadData { [weak self] (macosVersions, macosSuccess, macosXVersions, macosXSuccess) in
            
            if macosSuccess == true && macosXSuccess == true {
                
                guard let version = macosVersions, let versionX = macosXVersions else { return }
                self?.macosVersions = versionX + version
            }
        }
        DispatchQueue.main.async {
            self.setupCollection()
        }
    }
}

extension VersionsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return macosVersions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: VersionCollectionViewCell = (collectionView.dequeueReusableCell(withReuseIdentifier: CollectionParameters.cellIdentifier, for: indexPath) as? VersionCollectionViewCell) else { return VersionCollectionViewCell() }
        cell.setVersionLabelText(version: macosVersions[indexPath.item].version)
        cell.setNameLabelText(name: macosVersions[indexPath.item].codename)
        cell.setVersionImage(image: macosVersions[indexPath.item].image)
        cell.setCellWidth()
        cell.setCellHeight()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let viewController = storyboard?.instantiateViewController(identifier: CollectionParameters.controllerToOpenIdentifier) as? DetailViewController {
            _ = viewController.view
            viewController.getData(version: macosVersions[indexPath.item])
            
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
