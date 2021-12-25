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
    
    var rectangles: [Rectangle] = .init(repeatElement(Rectangle(height: 0, color: UIColor.white), count: CellsParameters.cellsEnd))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddButton()
    }
    
    private func setupAddButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addRectangle)
        )
    }
    
    @objc private func addRectangle() {
        rectangles.append(Rectangle(height: 0, color: UIColor.white))
        let indexPath = IndexPath(row: rectangles.count - 1, section: 0)
        collectionView.insertItems(at: [indexPath])
    }
}
