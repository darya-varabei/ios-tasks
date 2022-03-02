//
//  Coordinator.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/22/22.
//

import Foundation
import UIKit

protocol Coordinator: class {
    var rootViewController: UIViewController { get }
    var childCoordinators: [Coordinator] { get }
    func start()
}
