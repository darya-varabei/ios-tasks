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

    //var parentCoordinator: BaseCoordinator?
    var childCoordinators: [Coordinator] = []
    
    lazy var rootViewController: UIViewController = UIViewController()
    
    func start() -> UIViewController {
        rootViewController = UINavigationController(rootViewController: BooksListViewController(delegate: self))
        //rootViewController.
        return rootViewController
    }
    
    func moveTo(flow: AppFlow, cellViewModel: BookCellViewModel? = nil, viewModelObject: ViewModelGetObject? = nil) {
        switch flow {
        case .books(let screen):
            guard let scene = screen else { return }
            //handleBooksFlow(for: scene, cellViewModel: cellViewModel, viewModelObject: viewModelObject)
        default:
            break
            //parentCoordinator?.moveTo(flow: .books(.allBooksScreen), cellViewModel: cellViewModel, viewModelObject: viewModelObject)
        }
    }
    
//    private func handleBooksFlow(for screen: Books, cellViewModel: BookCellViewModel?, viewModelObject: ViewModelGetObject? = nil) {
//        switch screen {
//        case .allBooksScreen:
//            navigationRootViewController?.popToRootViewController(animated: true)
//        case .detailsScreen:
//            guard let cellViewModel = cellViewModel  else { return }
//            goToDetailScreenWith(cellViewModel: cellViewModel, viewModelObject: viewModelObject)
//        }
//    }
    
    func goToDetailView(flow: AppFlow, cellViewModel: BookCellViewModel?, viewModelObject: ViewModelGetObject?) {
        let detailViewController = BookDetailViewController(delegate: self, cellViewModel: cellViewModel, viewModelObject: viewModelObject, flow: .books(.allBooksScreen))
        navigationRootViewController?.pushViewController(detailViewController, animated: true)
    }
    
    func resetToRoot() -> Self {
        navigationRootViewController?.popToRootViewController(animated: false)
        return self
    }
}
