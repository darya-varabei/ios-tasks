//
//  ViewController.swift
//  Collection
//
//  Created by Дарья Воробей on 12/24/21.
//

import UIKit

class ViewController: UICollectionViewController {
    
    private enum CellsParameters {
        static let cellsEnd = 100
    }
    
    var colors: [UIColor] = .init(repeatElement(UIColor.white, count: CellsParameters.cellsEnd))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddButton()
    }
    
    private func setupAddButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addRectangle(_:))
        )
    }
    
    @objc private func addRectangle(_ sender: AnyObject) {
        colors.append(UIColor.white)
        let indexPath = IndexPath(row: colors.count - 1, section: 0)
        collectionView.insertItems(at: [indexPath])
    }
}
