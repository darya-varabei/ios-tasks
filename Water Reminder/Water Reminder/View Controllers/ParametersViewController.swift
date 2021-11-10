//
//  ParametersViewController.swift
//  Water Reminder
//
//  Created by Darya on 11/10/21.
//

import Foundation
import UIKit

class ParametersViewController: UIViewController {
    
    @IBOutlet weak var lblRecommended: UILabel!
    @IBOutlet weak var txtRecommended: UITextField!
    @IBOutlet weak var setGender: UISegmentedControl!
    @IBOutlet weak var lblSetBodyweight: UILabel!
    @IBOutlet weak var txtBodyWeight: UITextField!
    @IBOutlet weak var lblSetActivity: UILabel!
    @IBOutlet weak var lblActivity: UILabel!
    @IBOutlet weak var stepperActivity: UIStepper!
    @IBOutlet weak var btnConfirm: UIButton!
    
    override func viewDidLoad() {
    }
}
