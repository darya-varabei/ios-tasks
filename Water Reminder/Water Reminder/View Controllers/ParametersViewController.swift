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
    
    private enum textFieldConstraint: CGFloat {
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
        constForLblRecommended()
        constForTxtRecommended()
        constSegmControl()
        textFieldRecommended?.keyboardType = .numberPad
        textFieldBodyWeight?.keyboardType = .numberPad
        setUserParameters()
        hideKeyboardWhenTappedAround()
        setGender?.addTarget(self, action: #selector(genderValueChange), for: .valueChanged)
        textFieldBodyWeight?.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        stepperActivity?.addTarget(self, action: #selector(stepperValueChange), for: .valueChanged)
        setGender?.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    private func setUserParameters() {
        if UserDefaults.standard.double(forKey: UserParameters.bodyweight.rawValue) != 0 {
            textFieldBodyWeight?.text?.append(String(UserDefaults.standard.double(forKey: UserParameters.bodyweight.rawValue)))
            labelActivity?.text = "\(String(UserDefaults.standard.double(forKey: UserParameters.activity.rawValue)))"
            textFieldRecommended?.text?.append(String(UserDefaults.standard.double(forKey: UserParameters.doze.rawValue)))
        }
        else {
            textFieldBodyWeight?.text?.append(String(user.weight))
            labelActivity?.text = String(user.averageSportDurationADay)
            textFieldRecommended?.text?.append(String(user.recommendedDoze))
        }
    }
    
    private func constForLblRecommended() {
        labelRecommended?.translatesAutoresizingMaskIntoConstraints = false
        labelRecommended?.heightAnchor.constraint(equalToConstant: LabelConstraint.height.rawValue).isActive = true
        labelRecommended?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LabelConstraint.height.rawValue).isActive = true
        labelRecommended?.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -LabelConstraint.height.rawValue).isActive = true
        labelRecommended?.topAnchor.constraint(equalTo: view.topAnchor, constant: LabelConstraint.top.rawValue).isActive = true
    }
    
    private func constForTxtRecommended() {
        textFieldRecommended?.translatesAutoresizingMaskIntoConstraints = false
        textFieldRecommended?.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -textFieldConstraint.sides.rawValue).isActive = true
        textFieldRecommended?.heightAnchor.constraint(equalToConstant: textFieldConstraint.height.rawValue).isActive = true
        textFieldRecommended?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: textFieldConstraint.sides.rawValue).isActive = true
        textFieldRecommended?.topAnchor.constraint(equalTo: view.topAnchor, constant: textFieldConstraint.top.rawValue).isActive = true
    }
    
    private func constSegmControl() {
        setGender?.translatesAutoresizingMaskIntoConstraints = false
        setGender?.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -SegmentConstraint.sides.rawValue).isActive = true
        setGender?.heightAnchor.constraint(equalToConstant: SegmentConstraint.height.rawValue).isActive = true
        setGender?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: SegmentConstraint.sides.rawValue).isActive = true
        setGender?.topAnchor.constraint(equalTo: view.topAnchor, constant: SegmentConstraint.top.rawValue).isActive = true
    }
    
    private func constBtnConfirm() {
        buttonConfirm?.translatesAutoresizingMaskIntoConstraints = false
        buttonConfirm?.widthAnchor.constraint(equalToConstant: ButtonConstraint.width.rawValue).isActive = true
        buttonConfirm?.heightAnchor.constraint(equalToConstant: ButtonConstraint.height.rawValue).isActive = true
        buttonConfirm?.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -ButtonConstraint.side.rawValue).isActive = true
        buttonConfirm?.topAnchor.constraint(equalTo: view.topAnchor, constant: ButtonConstraint.top.rawValue).isActive = true
    }
    
    private func constBtnCancel() {
        buttonCancel?.translatesAutoresizingMaskIntoConstraints = false
        buttonCancel?.widthAnchor.constraint(equalToConstant: ButtonConstraint.width.rawValue).isActive = true
        buttonCancel?.heightAnchor.constraint(equalToConstant: ButtonConstraint.height.rawValue).isActive = true
        buttonCancel?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: ButtonConstraint.side.rawValue).isActive = true
        buttonCancel?.topAnchor.constraint(equalTo: view.topAnchor, constant: ButtonConstraint.top.rawValue).isActive = true
    }
    
    @objc private func textFieldDidChange() {
        user.weight = textFieldBodyWeight?.text?.toDouble() ?? 0.0
        user.averageSportDurationADay = labelActivity?.text?.toDouble() ?? 0.0
        user.countRecommendedWater()
        textFieldRecommended?.text = "\(user.recommendedDoze)"
    }
    
    @objc private func genderValueChange() {
        
        if setGender?.selectedSegmentIndex == 0 {
            user.gender = .male
        }
        else if setGender?.selectedSegmentIndex == 1 {
            user.gender = .female
        }
        else {
            user.gender = .other
        }
        user.countRecommendedWater()
        textFieldRecommended?.text = "\(user.recommendedDoze)"
    }
    
    @objc private func stepperValueChange(_ sender: UIStepper) {
        labelActivity?.text = "\(Float(sender.value).description) hr"
        user.averageSportDurationADay = Double(sender.value)
        user.countRecommendedWater()
        textFieldRecommended?.text = "\(user.recommendedDoze)"
    }
    
    @IBAction private func btnConfirmUser(_ sender: Any) {
        
        UserDefaults.standard.setValue(user.weight, forKey: UserParameters.bodyweight.rawValue)
        UserDefaults.standard.setValue(user.averageSportDurationADay, forKey: UserParameters.activity.rawValue)
        UserDefaults.standard.setValue(user.recommendedDoze, forKey: UserParameters.doze.rawValue)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func cancelUserData(_ sender: Any) {
        
        user.weight = UserDefaults.standard.double(forKey: UserParameters.bodyweight.rawValue)
        user.averageSportDurationADay = UserDefaults.standard.double(forKey: UserParameters.activity.rawValue)
        user.recommendedDoze = UserDefaults.standard.double(forKey: UserParameters.doze.rawValue)
        navigationController?.popViewController(animated: true)
    }
}
