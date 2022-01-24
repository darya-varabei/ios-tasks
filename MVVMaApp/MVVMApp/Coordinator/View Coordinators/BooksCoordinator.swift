//
//  BooksCoordinator.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/22/22.
//

import Foundation
import UIKit

class BooksCoordinator: BooksBaseCoordinator {

    var parentCoordinator: BaseCoordinator?
    
    lazy var rootViewController: UIViewController = UIViewController()
    
    func start() -> UIViewController {
        rootViewController = UINavigationController(rootViewController: BooksListViewController(coordinator: self))
        return rootViewController
    }
    
    func moveTo(flow: AppFlow, userData: BookCellViewModel? = nil, viewModelObject: ViewModelGetObject? = nil) {
        switch flow {
        case .books(let screen):
            handleBooksFlow(for: screen, userData: userData, viewModelObject: viewModelObject)
        default:
            parentCoordinator?.moveTo(flow: flow, userData: userData, viewModelObject: viewModelObject)
        }
    }
    
    private func handleBooksFlow(for screen: Books, userData: BookCellViewModel?, viewModelObject: ViewModelGetObject? = nil) {
        switch screen {
        case .allBooksScreen:
            navigationRootViewController?.popToRootViewController(animated: true)
        case .detailsScreen:
            guard let data = userData  else { return }
            goToDetailScreenWith(cellViewModel: data, viewModelObject: viewModelObject)
        }
    }
    
    func goToDetailScreenWith(cellViewModel: BookCellViewModel, viewModelObject: ViewModelGetObject?) {
        let detailViewController = BookDetailViewController(coordinator: self, cellViewModel: cellViewModel, viewModelObject: viewModelObject)
        navigationRootViewController?.pushViewController(detailViewController, animated: true)
    }
    
    func resetToRoot() -> Self {
        navigationRootViewController?.popToRootViewController(animated: false)
        return self
    }
}
