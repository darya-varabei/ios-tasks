//
//  ViewController.swift
//  macos-versions
//
//  Created by Дарья Воробей on 1/3/22.
//

import UIKit

class VersionsViewController: UIViewController {

    @IBOutlet private var versionsCollectionView: UICollectionView!
    private let parserManager = ParserManager()
    private var macosVersions: [Version]? {
        didSet {
            DispatchQueue.main.async {
                self.versionsCollectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.global(qos: .background).async {
            self.fetchData()
        }
    }

    private func setupCollection() {
        versionsCollectionView.delegate = self
        versionsCollectionView.dataSource = self
        versionsCollectionView.register(UINib(nibName: "VersionCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "VersionCollectionViewCell")
    }
    
    private func fetchData() {
        ParserManager.loadData { [weak self] (version, success, versionX, successX) in
            
            if success == true && successX == true {
                
                guard let version = version, let versionX = versionX else { return }
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
        return macosVersions?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: VersionCollectionViewCell = (collectionView.dequeueReusableCell(withReuseIdentifier: "VersionCollectionViewCell", for: indexPath) as? VersionCollectionViewCell) else { return VersionCollectionViewCell() }
            cell.setVersionLabelText(version: macosVersions?[indexPath.item].version ?? "")
            cell.setNameLabelText(name: macosVersions?[indexPath.item].codename ?? "")
            cell.setVersionImage(image: macosVersions?[indexPath.item].image ?? "")
            cell.setCellWidth()
        return cell
    }
}
