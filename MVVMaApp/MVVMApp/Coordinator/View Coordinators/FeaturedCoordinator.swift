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
    
    func moveTo(flow: AppFlow, userData: BookCellViewModel? = nil) {
        switch flow {
        case .featured(let screen):
            handleFeaturedFlow(for: screen, userData: userData)
        default:
            parentCoordinator?.moveTo(flow: flow, userData: userData)
        }
    }
    
    private func handleFeaturedFlow(for screen: FeaturedBooks, userData: BookCellViewModel? = nil) {
        switch screen {
        case .featuredScreen:
            resetToRoot(animated: false)
        case .detailScreen:
            break
        }
    }
   
    @discardableResult
    func resetToRoot(animated: Bool) -> Self {
        navigationRootViewController?.popToRootViewController(animated: animated)
        return self
    }
}
