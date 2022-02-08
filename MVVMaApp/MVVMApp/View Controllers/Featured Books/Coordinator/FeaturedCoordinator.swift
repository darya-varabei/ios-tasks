//
//  FeaturedCoordinator.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/23/22.
//

import Foundation
import UIKit

class FeaturedCoordinator: Coordinator, ControllerDelegate {
    
    var rootViewController: UIViewController = UIViewController()
    var childCoordinators: [Coordinator] = []
    
    init(tabBarController: UINavigationController) {
        self.rootViewController = tabBarController
    }
    
    func start() {
        rootViewController = UINavigationController(rootViewController: FeaturedItemsViewController(delegate: self))
    }
    
    func goToDetailView(flow: AppFlow, cellViewModel: BookCellViewModel?, viewModelObject: BookDetailViewModel?) {
        let detailViewController = BookDetailViewController( cellViewModel: cellViewModel, viewModelObject: viewModelObject)
        navigationRootViewController?.pushViewController(detailViewController, animated: true)
    }
}

extension FeaturedCoordinator {
    var navigationRootViewController: UINavigationController? {
        get {
            (rootViewController as? UINavigationController)
        }
    }
    
    func resetToRoot(animated: Bool) -> Self {
        navigationRootViewController?.popToRootViewController(animated: animated)
        return self
    }
}
