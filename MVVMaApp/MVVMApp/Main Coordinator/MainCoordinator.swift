//
//  MainCoordinator.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/22/22.
//

import Foundation
import UIKit

enum AppFlow {
    case books(Books?)
    case featured(FeaturedBooks?)
}

enum Books {
    case allBooksScreen
    case detailsScreen
}

enum FeaturedBooks {
    case featuredScreen
    case detailScreen
}

class MainCoordinator: Coordinator {
    
    private enum TabBarItems {
        static let booksTitle = "Books"
        static let bookSymbol = "book"
        static let favouriteTitle = "Favourite"
        static let starSymbol = "star"
    }

    var rootViewController: UIViewController
    var childCoordinators: [Coordinator] = []
    
    init(tabBarController: UITabBarController) {
        self.rootViewController = tabBarController
    }

    func start() {
        childCoordinators.append(BooksCoordinator(tabBarController: UINavigationController()))
        childCoordinators.append(FeaturedCoordinator(tabBarController: UINavigationController()))
        childCoordinators[1].start()
        childCoordinators[0].start()
        let bookViewController = childCoordinators[0].rootViewController
        bookViewController.tabBarItem = UITabBarItem(title: TabBarItems.booksTitle, image: UIImage(systemName: TabBarItems.bookSymbol), tag: 0)
        
        let featuredViewController = childCoordinators[1].rootViewController
        featuredViewController.tabBarItem = UITabBarItem(title: TabBarItems.favouriteTitle, image: UIImage(systemName: TabBarItems.starSymbol), tag: 1)
        
        (rootViewController as? UITabBarController)?.viewControllers = [bookViewController, featuredViewController]
    }
        
    func moveTo(flow: AppFlow, cellViewModel: BookCellViewModel?, viewModelObject: ViewModelGetObject?) {
        switch flow {
        case .books:
            goToBooksFlow(flow)
        case .featured:
            goToFeaturedFlow(flow)
        }
    }
    
    private func goToFeaturedFlow(_ flow: AppFlow) {
        (rootViewController as? UITabBarController)?.selectedIndex = 1
    }
    
    private func goToBooksFlow(_ flow: AppFlow) {
        (rootViewController as? UITabBarController)?.selectedIndex = 0
    }
}
