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
    
    func moveTo(flow: AppFlow, userData: BookCellViewModel? = nil) {
        switch flow {
        case .books(let screen):
            handleBooksFlow(for: screen, userData: userData)
        default:
            parentCoordinator?.moveTo(flow: flow, userData: userData)
        }
    }
    
    private func handleBooksFlow(for screen: Books, userData: BookCellViewModel?) {
        switch screen {
        case .allBooksScreen:
            navigationRootViewController?.popToRootViewController(animated: true)
        case .detailsScreen:
            guard let data = userData  else { return }
            goToDetailScreenWith(cellViewModel: data)
        }
    }
    
    func goToDetailScreenWith(cellViewModel: BookCellViewModel) {
        let detailViewController = BookDetailViewController(coordinator: self, cellViewModel: cellViewModel)
        navigationRootViewController?.pushViewController(detailViewController, animated: true)
    }
    
    func resetToRoot() -> Self {
        navigationRootViewController?.popToRootViewController(animated: false)
        return self
    }
}
