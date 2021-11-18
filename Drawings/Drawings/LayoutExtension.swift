//
//  LayoutExtension.swift
//  Drawings
//
//  Created by Darya on 11/18/21.
//

import Foundation
import UIKit

extension ViewController {
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { context in
            self.collectionView.collectionViewLayout.invalidateLayout()
        }, completion: nil)
    }
}
