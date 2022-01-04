//
//  SecondSegue.swift
//  NavigationAnimation
//
//  Created by Дарья Воробей on 12/17/21.
//

import Foundation
import UIKit

class FadeInSegue: UIStoryboardSegue {
    
    var selfRetainer: FadeInSegue? = nil
    
    override func perform() {
        destination.transitioningDelegate = self
        selfRetainer = self
        destination.modalPresentationStyle = .overCurrentContext
        source.present(destination, animated: true, completion: nil)
    }
}
