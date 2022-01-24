//
//  FeaturedCoordinator.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/23/22.
//

import Foundation
import UIKit

class FeaturedCoordinator: FeaturedBaseCoordinator {
    
    var parentCoordinator: BaseCoordinator?
    var rootViewController: UIViewController = UIViewController()
    
    func start() -> UIViewController {
        rootViewController = UINavigationController(rootViewController: FeaturedItemsViewController(coordinator: self))
        return rootViewController
    }
    
    func moveTo(flow: AppFlow, userData: BookCellViewModel? = nil, viewModelObject: ViewModelGetObject? = nil) {
        switch flow {
        case .featured(let screen):
            handleFeaturedFlow(for: screen!, userData: userData, viewModelObject: viewModelObject)
        default:
            parentCoordinator?.moveTo(flow: .featured(.featuredScreen), userData: userData, viewModelObject: nil)
        }
    }
    
    private func handleFeaturedFlow(for screen: FeaturedBooks, userData: BookCellViewModel? = nil, viewModelObject: ViewModelGetObject? = nil) {
        switch screen {
        case .featuredScreen:
            resetToRoot(animated: false)
        case .detailScreen:
            guard let data = userData  else { return }
            goToDetailScreenWith(cellViewModel: data, viewModelObject: viewModelObject)
            break
        }
    }
    
    func goToDetailScreenWith(cellViewModel: BookCellViewModel, viewModelObject: ViewModelGetObject?) {
        let detailViewController = BookDetailViewController(coordinator: self, cellViewModel: cellViewModel, viewModelObject: viewModelObject, flow: .featured(.featuredScreen))
        navigationRootViewController?.pushViewController(detailViewController, animated: true)
    }
   
    @discardableResult
    func resetToRoot(animated: Bool) -> Self {
        navigationRootViewController?.popToRootViewController(animated: animated)
        return self
    }
}
