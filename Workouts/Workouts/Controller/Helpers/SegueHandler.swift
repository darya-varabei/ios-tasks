//
//  SegueHandler.swift
//  Workouts
//
//  Created by Дарья Воробей on 2/4/22.
//

import Foundation
import UIKit

protocol SegueHandler {
    associatedtype SegueIdentifier: RawRepresentable
}

extension SegueHandler where Self: UIViewController, SegueIdentifier.RawValue == String {
    func segueIdentifier(for segue: UIStoryboardSegue) -> SegueIdentifier? {
        guard let identifier = segue.identifier,
              let segueIdentifier = SegueIdentifier(rawValue: identifier)
        else { return nil }
        return segueIdentifier
    }
    
    func performSegue(withIdentifier segueIdentifier: SegueIdentifier) {
        performSegue(withIdentifier: segueIdentifier.rawValue, sender: nil)
    }
}
