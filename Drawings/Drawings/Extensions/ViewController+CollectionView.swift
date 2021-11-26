//
//  ViewController+CollectionView.swift
//  Drawings
//
//  Created by Дарья Воробей on 11/26/21.
//

import Foundation
import UIKit

extension ViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let _ = dataSource.itemIdentifier(for: indexPath) else {
            return
        }
        let drawingViewController = DrawingViewController()
        present(drawingViewController, animated: true, completion: nil)
    }
}
