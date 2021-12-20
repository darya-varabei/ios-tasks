//
//  SwipeToBottom.swift
//  NavigationAnimation
//
//  Created by Дарья Воробей on 12/18/21.
//

import Foundation
import UIKit

class SwipeToBottom: UIStoryboardSegue {
    
    let transition = CATransition()
    
    override func perform() {
        
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = setTransitionSubtype()
        
        source.view.window?.layer.add(transition, forKey: kCATransition)
        source.present(destination, animated: false, completion: nil)
    }
    
    func setTransitionSubtype() -> CATransitionSubtype {
        
        let transitionSubtype = CATransitionSubtype.fromTop
        return transitionSubtype
    }
}
