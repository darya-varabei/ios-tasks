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

    lazy var booksCoordinator: BooksCoordinator = BooksCoordinator()
    lazy var featuredCoordinator: FeaturedCoordinator = FeaturedCoordinator()
    lazy var rootViewController: UIViewController  = UITabBarController()
    
    func start() -> UIViewController {
        let booksViewController = booksCoordinator.start()
        booksViewController.tabBarItem = UITabBarItem(title: ToolbarItems.booksTitle, image: UIImage(systemName: ToolbarItems.bookSymbol), tag: 0)
        
        let featuredViewController = featuredCoordinator.start()
        featuredViewController.tabBarItem = UITabBarItem(title: ToolbarItems.favouriteTitle, image: UIImage(systemName: ToolbarItems.starSymbol), tag: 1)
        
        (rootViewController as? UITabBarController)?.viewControllers = [booksViewController, featuredViewController]
                
        return rootViewController
    }
        
    func moveTo(flow: AppFlow, cellViewModel: BookCellViewModel?, viewModelObject: ViewModelGetObject?) {
        switch flow {
        case .books:
            goToBooksFlow(flow)
        case .featured:
            goToFeaturedFlow(flow)
        }
    }

    func resetToRoot() -> Self {
        moveTo(flow: .books(.allBooksScreen), cellViewModel: nil, viewModelObject: nil)
        return self
    }
    
    private func goToFeaturedFlow(_ flow: AppFlow) {
        (rootViewController as? UITabBarController)?.selectedIndex = 1
    }
    
    private func goToBooksFlow(_ flow: AppFlow) {
        (rootViewController as? UITabBarController)?.selectedIndex = 0
    }
}
