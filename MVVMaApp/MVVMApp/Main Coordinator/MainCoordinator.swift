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

class MainCoordinator: BaseCoordinator {
    
    private enum TabBarItems {
        static let booksTitle = "Books"
        static let bookSymbol = "book"
        static let favouriteTitle = "Favourite"
        static let starSymbol = "star"
    }

    lazy var booksCoordinator: BooksCoordinator = BooksCoordinator()
    lazy var featuredCoordinator: FeaturedCoordinator = FeaturedCoordinator()
    lazy var rootViewController: UIViewController  = UITabBarController()
    
    func start() {
        booksCoordinator.start()
        let bookViewController = booksCoordinator.rootViewController
        bookViewController.tabBarItem = UITabBarItem(title: TabBarItems.booksTitle, image: UIImage(systemName: TabBarItems.bookSymbol), tag: 0)
        
        featuredCoordinator.start()
        let featuredViewController = featuredCoordinator.rootViewController
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
