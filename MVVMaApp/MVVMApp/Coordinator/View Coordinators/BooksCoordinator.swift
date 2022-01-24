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
    
    func moveTo(flow: AppFlow, cellViewModel: BookCellViewModel? = nil, viewModelObject: ViewModelGetObject? = nil) {
        switch flow {
        case .books(let screen):
            guard let scene = screen else { return }
            handleBooksFlow(for: scene, cellViewModel: cellViewModel, viewModelObject: viewModelObject)
        default:
            parentCoordinator?.moveTo(flow: .books(.allBooksScreen), cellViewModel: cellViewModel, viewModelObject: viewModelObject)
        }
    }
    
    private func handleBooksFlow(for screen: Books, cellViewModel: BookCellViewModel?, viewModelObject: ViewModelGetObject? = nil) {
        switch screen {
        case .allBooksScreen:
            navigationRootViewController?.popToRootViewController(animated: true)
        case .detailsScreen:
            guard let cellViewModel = cellViewModel  else { return }
            goToDetailScreenWith(cellViewModel: cellViewModel, viewModelObject: viewModelObject)
        }
    }
    
    func goToDetailScreenWith(cellViewModel: BookCellViewModel, viewModelObject: ViewModelGetObject?) {
        let detailViewController = BookDetailViewController(coordinator: self, cellViewModel: cellViewModel, viewModelObject: viewModelObject, flow: .books(.allBooksScreen))
        navigationRootViewController?.pushViewController(detailViewController, animated: true)
    }
    
    func resetToRoot() -> Self {
        navigationRootViewController?.popToRootViewController(animated: false)
        return self
    }
}
