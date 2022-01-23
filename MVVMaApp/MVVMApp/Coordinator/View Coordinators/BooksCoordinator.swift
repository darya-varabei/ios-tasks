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
            handleHomeFlow(for: screen, userData: userData)
        default:
            parentCoordinator?.moveTo(flow: flow, userData: userData)
        }
    }
    
    private func handleHomeFlow(for screen: Books, userData: [String: Any]?) {
        switch screen {
        case .initialScreen:
            navigationRootViewController?.popToRootViewController(animated: true)
        case .doubleButtonScreen:
            guard let title = userData?["title"] as? String else { return }
            goToHome2ScreenWith(title: title)
        }
    }
    
    func goToHome2ScreenWith(title: String) {
        let home2ViewController = DetailViewController(coordinator: self)
        home2ViewController.title = title
        navigationRootViewController?.pushViewController(home2ViewController, animated: true)
    }
//
//    func goToFavoritesFlow() {
//        parentCoordinator?.moveTo(flow: .orders(.firstScreen))
//    }
//
//    func goToDeepViewInFavoriteTab() {
//
//        DispatchQueue.main.asyncAfter(deadline: .now()) { [weak self] in
//                self?.parentCoordinator?.ordersCoordinator
//                    .resetToRoot(animated: false)
//            }
//            DispatchQueue.main.asyncAfter(deadline: .now()+0.1) { [weak self] in
//                self?.parentCoordinator?.ordersCoordinator
//                    .goToOrder2Screen(animated: false)
//                    .goToOrder3Screen(animated: false)
//                self?.parentCoordinator?.moveTo(flow: .orders)
//            }
//    }
    
    func resetToRoot() -> Self {
        navigationRootViewController?.popToRootViewController(animated: false)
        return self
    }
}
