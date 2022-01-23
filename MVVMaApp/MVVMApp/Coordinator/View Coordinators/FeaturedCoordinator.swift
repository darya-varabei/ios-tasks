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
    
    func moveTo(flow: AppFlow, userData: [String : Any]? = nil) {
        switch flow {
        case .featured(let screen):
            handleOrdersFlow(for: screen, userData: userData)
        default:
            parentCoordinator?.moveTo(flow: flow, userData: userData)
        }
    }
    
    private func handleOrdersFlow(for screen: FeaturedBooks, userData: [String : Any]? = nil) {
        switch screen {
        case .firstScreen:
            resetToRoot(animated: false)
        case .secondScreen:
            break
           // handleGoToSecondScreen()
//        case .thirdScreen:
//            handleGoToThirdScreen()
        }
    }
    
//    private func handleGoToSecondScreen() {
//        resetToRoot(animated: false)
//        navigationRootViewController?.pushViewController(DetailViewController(coordinator: self), animated: false)
//
//    }
//
//    private func handleGoToThirdScreen() {
//        resetToRoot(animated: false)
//        navigationRootViewController?.pushViewController(Orders2ViewController(coordinator: self), animated: false)
//        navigationRootViewController?.pushViewController(Orders3ViewController(coordinator: self), animated: false)

 //   }
   
    @discardableResult
    func resetToRoot(animated: Bool) -> Self {
        navigationRootViewController?.popToRootViewController(animated: animated)
        return self
    }
}
