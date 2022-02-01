//
//  BooksCoordinator.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/22/22.
//

import Foundation
import UIKit

protocol ControllerDelegate {
    func goToDetailView(flow: AppFlow, cellViewModel: BookCellViewModel?, viewModelObject: ViewModelGetObject?)
    @discardableResult func resetToRoot(animated: Bool) -> Self
}

class BooksCoordinator: Coordinator, ControllerDelegate {

    lazy var rootViewController: UIViewController = UIViewController()
    
    func start() -> UIViewController {
        let viewModel = BookViewModel(delegate: self)
        rootViewController = UINavigationController(rootViewController: BooksListViewController(viewModel: viewModel))
        return rootViewController
    }
    
    func goToDetailView(flow: AppFlow, cellViewModel: BookCellViewModel?, viewModelObject: ViewModelGetObject?) {
        let detailViewController = BookDetailViewController( cellViewModel: cellViewModel, viewModelObject: viewModelObject)
        navigationRootViewController?.pushViewController(detailViewController, animated: true)
    }
    
    func resetToRoot() -> Self {
        navigationRootViewController?.popToRootViewController(animated: false)
        return self
    }
}
