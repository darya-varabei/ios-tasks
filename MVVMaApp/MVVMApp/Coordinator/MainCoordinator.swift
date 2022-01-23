//
//  MainCoordinator.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/22/22.
//

import Foundation
import UIKit

enum AppFlow {
    case books(Books)
    case featured(FeaturedBooks)
}

enum Books {
    case initialScreen
    case doubleButtonScreen
}

enum FeaturedBooks {
    case firstScreen
    case secondScreen
}

class MainCoordinator: BaseCoordinator {

    var parentCoordinator: BaseCoordinator?
    
    lazy var booksCoordinator: BooksBaseCoordinator = BooksCoordinator()
    lazy var featuredCoordinator: FeaturedBaseCoordinator = FeaturedCoordinator()
   // lazy var deepLinkCoordinator: DeepLinkBaseCoordinator = DeepLinkCoordinator(mainBaseCoordinator: self)
    
    lazy var rootViewController: UIViewController  = UITabBarController()
    
    func start() -> UIViewController {
        
        let homeViewController = booksCoordinator.start()
        booksCoordinator.parentCoordinator = self
        homeViewController.tabBarItem = UITabBarItem(title: "Books", image: UIImage(systemName: "book"), tag: 0)
        
        let ordersViewController = featuredCoordinator.start()
        featuredCoordinator.parentCoordinator = self
        ordersViewController.tabBarItem = UITabBarItem(title: "Favourite", image: UIImage(systemName: "star"), tag: 1)
        
        (rootViewController as? UITabBarController)?.viewControllers = [homeViewController,ordersViewController]
                
        return rootViewController
    }
        
    func moveTo(flow: AppFlow, userData: [String : Any]?) {
        switch flow {
        case .books:
            goToBooksFlow(flow)
        case .featured:
            goToFeaturedFlow(flow)
        }
    }
    
    private func goToFeaturedFlow(_ flow: AppFlow) {
        featuredCoordinator.moveTo(flow: flow, userData: nil)
        (rootViewController as? UITabBarController)?.selectedIndex = 1
        
    }
    
    private func goToBooksFlow(_ flow: AppFlow) {
        booksCoordinator.moveTo(flow: flow, userData: nil)
        (rootViewController as? UITabBarController)?.selectedIndex = 0
        
    }
//
//    func handleDeepLink(text: String) {
//        deepLinkCoordinator.handleDeeplink(deepLink: text)
//    }
    
    func resetToRoot() -> Self {
        booksCoordinator.resetToRoot(animated: false)
        moveTo(flow: .books(.initialScreen), userData: nil)
        return self
    }
    
}
