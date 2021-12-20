//
//  SwipeToTop.swift
//  NavigationAnimation
//
//  Created by Дарья Воробей on 12/20/21.
//

import Foundation
import UIKit

class SwipeToTop: SwipeToBottom {
    
    override func setTransitionSubtype() -> CATransitionSubtype {
        let transitionSubtype = CATransitionSubtype.fromBottom
        return transitionSubtype
    }
}
