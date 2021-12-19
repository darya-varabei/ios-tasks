//
//  SwipeToBottom.swift
//  NavigationAnimation
//
//  Created by Дарья Воробей on 12/18/21.
//

import Foundation
import UIKit

class SwipeToBottom: UIStoryboardSegue {
    override func perform() {
        let transition = CATransition()
        transition.duration = 0.5
        print("________________")
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromBottom
        
        source.view.window?.layer.add(transition, forKey: kCATransition)
        source.present(destination, animated: false, completion: nil)
    }
}
