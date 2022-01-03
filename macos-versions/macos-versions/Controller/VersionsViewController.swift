//
//  ViewController.swift
//  macos-versions
//
//  Created by Дарья Воробей on 1/3/22.
//

import UIKit

class VersionsViewController: UIViewController {

    @IBOutlet private var macosXCollectionView: UICollectionView!
    @IBOutlet private var macosCollectionView: UICollectionView!
    
    private var macosVersions: [Version]?
    private var macosXVersions: [Version]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func setupCollections() {
        macosCollectionView.delegate = self
        macosCollectionView.dataSource = self
        macosXCollectionView.delegate = self
        macosXCollectionView.dataSource = self
        macosCollectionView.accessibilityIdentifier = "macos"
        macosXCollectionView.accessibilityIdentifier = "macosX"
    }

}

extension VersionsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.accessibilityIdentifier == "macos" {
            return macosVersions?.count ?? 0
        }
        
        else {
            return macosXVersions?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}
