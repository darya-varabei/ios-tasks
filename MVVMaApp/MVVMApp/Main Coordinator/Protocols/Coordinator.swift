//
//  Coordinator.swift
//  MVVMApp
//
//  Created by Дарья Воробей on 1/22/22.
//

import Foundation
import UIKit

protocol Coordinator {
    var rootViewController: UIViewController { get set }
    var childCoordinators: [Coordinator] { get set }
    func start()
}
