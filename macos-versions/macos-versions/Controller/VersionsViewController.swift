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
    
    private let parserManager = ParserManager()
    private var macosVersions: [Version]? {
        didSet {
            DispatchQueue.main.async {
                self.macosCollectionView.reloadData()
            }
        }
    }
    private var macosXVersions: [Version]? {
        didSet {
            DispatchQueue.main.async {
                self.macosXCollectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.global(qos: .background).async {
            self.fetchData()
        }

            self.macosCollectionView.reloadData()
            self.macosXCollectionView.reloadData()
    }

    private func setupCollections() {
        macosCollectionView.delegate = self
        macosCollectionView.dataSource = self
        macosXCollectionView.delegate = self
        macosXCollectionView.dataSource = self
        macosCollectionView.accessibilityIdentifier = "macos"
        macosXCollectionView.accessibilityIdentifier = "macosX"
        macosCollectionView.register(UINib(nibName: "VersionCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "VersionCollectionViewCell")
        macosXCollectionView.register(UINib(nibName: "VersionCollectionViewCell", bundle: nil), forCellWithReuseIdentifier:"VersionCollectionViewCell")
    }
    
    private func fetchData() {
        ParserManager.loadData { [weak self] (version, success, versionX, successX) in
            
            if success == true && successX == true {
                
                guard let version = version else { return }
                self?.macosVersions = version
                guard let versionX = versionX else { return }
                self?.macosXVersions = versionX
            }
        }
        DispatchQueue.main.async {
            self.setupCollections()
        }
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
        guard let cell: VersionCollectionViewCell = (collectionView.dequeueReusableCell(withReuseIdentifier: "VersionCollectionViewCell", for: indexPath) as? VersionCollectionViewCell) else { return VersionCollectionViewCell() }
        if collectionView.accessibilityIdentifier == "macos" {
            cell.setVersionLabelText(version: macosVersions?[indexPath.item].version ?? "")
            cell.setNameLabelText(name: macosVersions?[indexPath.item].codename ?? "")
        }
        else {
            cell.setVersionLabelText(version: macosXVersions?[indexPath.item].version ?? "")
            cell.setNameLabelText(name: macosXVersions?[indexPath.item].codename ?? "")
        }
        cell.setCellWidth()
        return cell
    }
}
