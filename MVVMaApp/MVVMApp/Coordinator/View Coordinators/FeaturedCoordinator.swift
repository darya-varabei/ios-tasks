//
//  FeaturedCoordinator.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/23/22.
//

import Foundation
import UIKit

protocol FeaturedItemsViewControllerDelegate: class, ControllerDelegate {}

class FeaturedCoordinator: FeaturedBaseCoordinator, FeaturedItemsViewControllerDelegate {
    
    var rootViewController: UIViewController = UIViewController()
    
    func start() -> UIViewController {
        rootViewController = UINavigationController(rootViewController: FeaturedItemsViewController(delegate: self))
        return rootViewController
    }
    
    func goToDetailView(flow: AppFlow, cellViewModel: BookCellViewModel?, viewModelObject: ViewModelGetObject?) {
        let detailViewController = BookDetailViewController(delegate: self, cellViewModel: cellViewModel, viewModelObject: viewModelObject)
        navigationRootViewController?.pushViewController(detailViewController, animated: true)
    }
   
    @discardableResult
    func resetToRoot(animated: Bool) -> Self {
        navigationRootViewController?.popToRootViewController(animated: animated)
        return self
    }
}
