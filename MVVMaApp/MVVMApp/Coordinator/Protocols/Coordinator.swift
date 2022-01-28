//
//  Coordinator.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/22/22.
//

import Foundation
import UIKit

//protocol FlowCoordinator: AnyObject {
//    //var parentCoordinator: BaseCoordinator? { get set }
//}

protocol Coordinator {
    var rootViewController: UIViewController { get set }
    func start() -> UIViewController
    //func moveTo(flow: AppFlow, cellViewModel: BookCellViewModel?, viewModelObject: ViewModelGetObject?)
//    @discardableResult func resetToRoot(animated: Bool) -> Self
}

extension Coordinator {
    var navigationRootViewController: UINavigationController? {
        get {
            (rootViewController as? UINavigationController)
        }
    }
    
    func resetToRoot(animated: Bool) -> Self {
        navigationRootViewController?.popToRootViewController(animated: animated)
        return self
    }
}
