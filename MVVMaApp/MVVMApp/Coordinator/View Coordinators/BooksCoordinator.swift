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
    
    func moveTo(flow: AppFlow, userData: [String : Any]? = nil) {
        switch flow {
        case .books(let screen):
            handleBooksFlow(for: screen, userData: userData)
        default:
            parentCoordinator?.moveTo(flow: flow, userData: userData)
        }
    }
    
    private func handleBooksFlow(for screen: Books, userData: [String: Any]?) {
        switch screen {
        case .initialScreen:
            navigationRootViewController?.popToRootViewController(animated: true)
        case .doubleButtonScreen:
            guard let title = userData?["title"] as? String else { return }
            goToDetailScreenWith(title: title)
        }
    }
    
    func goToDetailScreenWith(title: String) {
        let home2ViewController = BookDetailViewController(coordinator: self)
        home2ViewController.title = title
        navigationRootViewController?.pushViewController(home2ViewController, animated: true)
    }
    
    func resetToRoot() -> Self {
        navigationRootViewController?.popToRootViewController(animated: false)
        return self
    }
}
