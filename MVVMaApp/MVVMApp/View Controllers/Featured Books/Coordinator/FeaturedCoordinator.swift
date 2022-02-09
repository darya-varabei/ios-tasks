//
//  FeaturedCoordinator.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/23/22.
//

import Foundation
import UIKit

class FeaturedCoordinator: Coordinator {
    
    var rootViewController: UIViewController = UIViewController()
    var childCoordinators: [Coordinator] = []
    
    var viewModel = FeaturedBookViewModel()
    
    init(tabBarController: UINavigationController) {
        self.rootViewController = tabBarController
    }
    
    func start() {
        rootViewController = UINavigationController(rootViewController: FeaturedItemsViewController(viewModel: viewModel))
        viewModel.goToDetailView = { flow, cellViewModel, viewModelObject in
            self.goToDetailView(flow: flow, cellViewModel: cellViewModel, viewModelObject: viewModelObject)
        }
        viewModel.resetToRoot = {
            self.resetToRoot(animated: true)
        }
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
    
    func resetToRoot(animated: Bool) {
        navigationRootViewController?.popToRootViewController(animated: animated)
    }
}
