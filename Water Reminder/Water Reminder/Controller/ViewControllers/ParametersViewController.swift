//
//  ParametersViewController.swift
//  Water Reminder
//
//  Created by Darya on 11/10/21.
//

import Foundation
import UIKit

class ParametersViewController: UIViewController {
    
    @IBOutlet private var labelRecommended: UILabel?
    @IBOutlet private var textFieldRecommended: UITextField?
    @IBOutlet private var setGender: UISegmentedControl?
    @IBOutlet private var labelSetBodyweight: UILabel?
    @IBOutlet private var textFieldBodyWeight: UITextField?
    @IBOutlet private var labelSetActivity: UILabel?
    @IBOutlet private var labelActivity: UILabel?
    @IBOutlet private var stepperActivity: UIStepper?
    @IBOutlet private var buttonConfirm: UIButton?
    @IBOutlet private var buttonCancel: UIButton?
    private var user = User.shared
    
    private enum LabelConstraint: CGFloat {
        case height = 20
        case top = 60
    }
    
    private enum TextFieldConstraint: CGFloat {
        case sides = 120
        case height = 40
        case top = 100
    }
    
    private enum SegmentConstraint: CGFloat {
        case sides = 40
        case height = 31
        case top = 184
    }
    
    private enum ButtonConstraint: CGFloat {
        case width = 160
        case height = 45
        case side = 23
        case top = 580
    }
    
    override func viewDidLoad() {
        setupKeyboard()
        setUserParameters()
        hideKeyboardWhenTappedAround()
        stepperActivity?.value = user.getActivity()
        defineControllersTargets()
    }
    
    private func setUserParameters() {
        if UserDefaults.standard.double(forKey: UserParameters.bodyweight.rawValue) != 0 {
            textFieldBodyWeight?.text?.append(String(UserDefaults.standard.double(forKey: UserParameters.bodyweight.rawValue)))
            labelActivity?.text = "\(String(UserDefaults.standard.double(forKey: UserParameters.activity.rawValue)))"
            textFieldRecommended?.text?.append(String(round(UserDefaults.standard.double(forKey: UserParameters.doze.rawValue) * Double(ControllerParameters.toRound)) / Double(ControllerParameters.toRound)))
        }
        else {
            textFieldBodyWeight?.text?.append(String(user.getWeight()))
            labelActivity?.text = String(user.getActivity())
            textFieldRecommended?.text?.append(String(user.getRecommendedDoze()))
        }
    }
    
    private func defineControllersTargets() {
        setGender?.addTarget(self, action: #selector(genderValueChange), for: .valueChanged)
        textFieldBodyWeight?.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        stepperActivity?.addTarget(self, action: #selector(stepperValueChange), for: .valueChanged)
        setGender?.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    private func setupKeyboard() {
        let bar = UIToolbar()
        textFieldRecommended?.keyboardType = .numberPad
        textFieldBodyWeight?.keyboardType = .numberPad
        textFieldRecommended?.inputAccessoryView = bar.hideKeyboardToolbar()
        textFieldBodyWeight?.inputAccessoryView = bar.hideKeyboardToolbar()
    }

    private func constForTextFieldRecommended() {
        textFieldRecommended?.translatesAutoresizingMaskIntoConstraints = false
        textFieldRecommended?.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -TextFieldConstraint.sides.rawValue).isActive = true
        textFieldRecommended?.heightAnchor.constraint(equalToConstant: TextFieldConstraint.height.rawValue).isActive = true
        textFieldRecommended?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: TextFieldConstraint.sides.rawValue).isActive = true
        textFieldRecommended?.topAnchor.constraint(equalTo: view.topAnchor, constant: TextFieldConstraint.top.rawValue).isActive = true
    }
    
    @objc private func textFieldDidChange() {
        user.setWeight(newWeight: textFieldBodyWeight?.text?.toDouble() ?? 0.0)
        user.setActivity(newActivity: labelActivity?.text?.toDouble() ?? 0.0)
        user.countRecommendedWater()
        textFieldRecommended?.text = "\(user.getRecommendedDoze())"
    }
    
    @objc private func genderValueChange() {
        
        if setGender?.selectedSegmentIndex == 0 {
            user.setGender(newGender: .male)
        }
        else if setGender?.selectedSegmentIndex == 1 {
            user.setGender(newGender: .female)
        }
        user.countRecommendedWater()
        textFieldRecommended?.text = "\(user.getRecommendedDoze())"
    }
    
    @objc private func stepperValueChange(_ sender: UIStepper) {
        labelActivity?.text = "\(Float(sender.value).description) hr"
        user.setActivity(newActivity: Double(sender.value))
        user.countRecommendedWater()
        textFieldRecommended?.text = "\(round(user.getRecommendedDoze() * Double(ControllerParameters.toRound)) / Double(ControllerParameters.toRound))"
    }
    
    @IBAction private func buttonConfirmUser(_ sender: Any) {
        
        UserDefaults.standard.setValue(user.getWeight(), forKey: UserParameters.bodyweight.rawValue)
        UserDefaults.standard.setValue(user.getActivity(), forKey: UserParameters.activity.rawValue)
        UserDefaults.standard.setValue(user.getRecommendedDoze(), forKey: UserParameters.doze.rawValue)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func cancelUserData(_ sender: Any) {
        
        user.setWeight(newWeight:  UserDefaults.standard.double(forKey: UserParameters.bodyweight.rawValue))
        user.setActivity(newActivity: UserDefaults.standard.double(forKey: UserParameters.activity.rawValue))
        user.setRecommendedDoze(newDoze: UserDefaults.standard.double(forKey: UserParameters.doze.rawValue))
        navigationController?.popViewController(animated: true)
    }
}
