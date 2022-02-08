//
//  BooksCoordinator.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/22/22.
//

import Foundation
import UIKit

class BooksCoordinator: Coordinator, ControllerDelegate {

    var rootViewController: UIViewController
    var childCoordinators: [Coordinator] = []
    
    init(tabBarController: UINavigationController) {
        self.rootViewController = tabBarController
    }
    
    func start() {
        let viewModel = BookViewModel(delegate: self)
        rootViewController = UINavigationController(rootViewController: BooksListViewController(viewModel: viewModel))
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
    
    func resetToRoot(animated: Bool) -> Self {
        navigationRootViewController?.popToRootViewController(animated: animated)
        return self
    }
}
