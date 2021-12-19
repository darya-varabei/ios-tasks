//
//  SwipeSegue.swift
//  NavigationAnimation
//
//  Created by Дарья Воробей on 12/18/21.
//

import Foundation
import UIKit

class SwipeToTopSegue: UIStoryboardSegue {
    
    func perform(withIdentifier identifier: String,
                 sender: Any?) {
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        if identifier == "swipeToTop" {
            transition.subtype = CATransitionSubtype.fromBottom
        }
        else {
            transition.subtype = CATransitionSubtype.fromTop
        }
        
        source.view.window?.layer.add(transition, forKey: kCATransition)
        source.present(destination, animated: false, completion: nil)
    }
}
