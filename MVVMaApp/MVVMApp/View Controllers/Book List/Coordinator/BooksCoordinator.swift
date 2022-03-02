//
//  BooksCoordinator.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/22/22.
//

import Foundation
import UIKit

class BooksCoordinator: Coordinator {

    var rootViewController: UIViewController
    var childCoordinators: [Coordinator] = []
    
    init(tabBarController: UINavigationController) {
        self.rootViewController = tabBarController
    }
    
    func start() {
        let viewModel = BookViewModel()
        rootViewController = UINavigationController(rootViewController: BooksListViewController(viewModel: viewModel))
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

extension BooksCoordinator {
    var navigationRootViewController: UINavigationController? {
        get {
            (rootViewController as? UINavigationController)
        }
    }
    
    func resetToRoot(animated: Bool) {
        navigationRootViewController?.popToRootViewController(animated: animated)
    }
}
