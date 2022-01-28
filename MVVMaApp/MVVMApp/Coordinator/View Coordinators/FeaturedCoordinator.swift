//
//  FeaturedCoordinator.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/23/22.
//

import Foundation
import UIKit

protocol FeaturedItemsViewControllerDelegate: class, ControllerDelegate {
}

class FeaturedCoordinator: FeaturedBaseCoordinator, FeaturedItemsViewControllerDelegate {
    
    var parentCoordinator: BaseCoordinator?
    var rootViewController: UIViewController = UIViewController()
    
    func start() -> UIViewController {
        rootViewController = UINavigationController(rootViewController: FeaturedItemsViewController(delegate: self))
        return rootViewController
    }
    
    func moveTo(flow: AppFlow, cellViewModel: BookCellViewModel? = nil, viewModelObject: ViewModelGetObject? = nil) {
        switch flow {
        case .featured(let screen):
            guard let scene = screen else { return }
            handleFeaturedFlow(for: scene, cellViewModel: cellViewModel, viewModelObject: viewModelObject)
        default:
            break
            //parentCoordinator?.moveTo(flow: .featured(.featuredScreen), cellViewModel: cellViewModel, viewModelObject: nil)
        }
    }
    
    private func handleFeaturedFlow(for screen: FeaturedBooks, cellViewModel: BookCellViewModel? = nil, viewModelObject: ViewModelGetObject? = nil) {
        switch screen {
        case .featuredScreen:
            resetToRoot(animated: false)
        case .detailScreen:
            guard let data = cellViewModel  else { return }
            goToDetailView(flow: .featured(.detailScreen), cellViewModel: data, viewModelObject: viewModelObject)
            break
        }
    }
//
    func goToDetailView(flow: AppFlow, cellViewModel: BookCellViewModel?, viewModelObject: ViewModelGetObject?) {
        let detailViewController = BookDetailViewController(delegate: self, cellViewModel: cellViewModel, viewModelObject: viewModelObject, flow: .featured(.featuredScreen))
        navigationRootViewController?.pushViewController(detailViewController, animated: true)
    }
   
    @discardableResult
    func resetToRoot(animated: Bool) -> Self {
        navigationRootViewController?.popToRootViewController(animated: animated)
        return self
    }
}
