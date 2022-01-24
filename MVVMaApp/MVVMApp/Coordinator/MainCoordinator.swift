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
    
    private enum ToolbarItems {
        static let booksTitle = "Books"
        static let bookSymbol = "book"
        static let favouriteTitle = "Favourite"
        static let starSymbol = "star"
    }

    var parentCoordinator: BaseCoordinator?
    lazy var booksCoordinator: BooksBaseCoordinator = BooksCoordinator()
    lazy var featuredCoordinator: FeaturedBaseCoordinator = FeaturedCoordinator()
    lazy var rootViewController: UIViewController  = UITabBarController()
    
    func start() -> UIViewController {
        
        let booksViewController = booksCoordinator.start()
        booksCoordinator.parentCoordinator = self
        booksViewController.tabBarItem = UITabBarItem(title: ToolbarItems.booksTitle, image: UIImage(systemName: ToolbarItems.bookSymbol), tag: 0)
        
        let featuredViewController = featuredCoordinator.start()
        featuredCoordinator.parentCoordinator = self
        featuredViewController.tabBarItem = UITabBarItem(title: ToolbarItems.favouriteTitle, image: UIImage(systemName: ToolbarItems.starSymbol), tag: 1)
        
        (rootViewController as? UITabBarController)?.viewControllers = [booksViewController, featuredViewController]
                
        return rootViewController
    }
        
    func moveTo(flow: AppFlow, userData: BookCellViewModel?, viewModelObject: ViewModelGetObject?) {
        switch flow {
        case .books:
            goToBooksFlow(flow)
        case .featured:
            goToFeaturedFlow(flow)
        }
    }
    
    private func goToFeaturedFlow(_ flow: AppFlow) {
        featuredCoordinator.moveTo(flow: flow, userData: nil, viewModelObject: nil)
        (rootViewController as? UITabBarController)?.selectedIndex = 1
    }
    
    private func goToBooksFlow(_ flow: AppFlow) {
        booksCoordinator.moveTo(flow: flow, userData: nil, viewModelObject: nil)
        (rootViewController as? UITabBarController)?.selectedIndex = 0
    }

    func resetToRoot() -> Self {
        booksCoordinator.resetToRoot(animated: false)
        moveTo(flow: .books(.allBooksScreen), userData: nil, viewModelObject: nil)
        return self
    }
}
