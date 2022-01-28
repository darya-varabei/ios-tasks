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

protocol BookListViewControllerDelegate: ControllerDelegate {}


class BooksCoordinator: BooksBaseCoordinator, BookListViewControllerDelegate {

    lazy var rootViewController: UIViewController = UIViewController()
    
    func start() -> UIViewController {
        rootViewController = UINavigationController(rootViewController: BooksListViewController(delegate: self))
        return rootViewController
    }
    
    func goToDetailView(flow: AppFlow, cellViewModel: BookCellViewModel?, viewModelObject: ViewModelGetObject?) {
        let detailViewController = BookDetailViewController(delegate: self, cellViewModel: cellViewModel, viewModelObject: viewModelObject)
        navigationRootViewController?.pushViewController(detailViewController, animated: true)
    }
    
    func resetToRoot() -> Self {
        navigationRootViewController?.popToRootViewController(animated: false)
        return self
    }
}
