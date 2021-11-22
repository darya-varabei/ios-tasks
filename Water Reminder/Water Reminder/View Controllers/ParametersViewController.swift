//
//  ParametersViewController.swift
//  Water Reminder
//
//  Created by Darya on 11/10/21.
//

import Foundation
import UIKit

class ParametersViewController: UIViewController {
    
    @IBOutlet private var lblRecommended: UILabel?
    @IBOutlet private var txtRecommended: UITextField?
    @IBOutlet private var setGender: UISegmentedControl?
    @IBOutlet private var lblSetBodyweight: UILabel?
    @IBOutlet private var txtBodyWeight: UITextField?
    @IBOutlet private var lblSetActivity: UILabel?
    @IBOutlet private var lblActivity: UILabel?
    @IBOutlet private var stepperActivity: UIStepper?
    @IBOutlet private var btnConfirm: UIButton?
    @IBOutlet private var btnCancel: UIButton?
    private var user = User.shared
    
    override func viewDidLoad() {
        constForLblRecommended()
        constForTxtRecommended()
        constSegmControl()
        constBtnConfirm()
        constBtnCancel()
        setUserParameters()
        
        setGender?.addTarget(self, action: #selector(genderValueChange), for: .valueChanged)
        txtBodyWeight?.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        stepperActivity?.addTarget(self, action: #selector(stepperValueChange), for: .valueChanged)
        setGender?.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    private func setUserParameters() {
        if UserDefaults.standard.double(forKey: UserParameters.bodyweight.rawValue) != 0 {
            txtBodyWeight?.text?.append(String(UserDefaults.standard.double(forKey: UserParameters.bodyweight.rawValue)))
            lblActivity?.text = "\(String(UserDefaults.standard.double(forKey: UserParameters.activity.rawValue)))"
            txtRecommended?.text?.append(String(UserDefaults.standard.double(forKey: UserParameters.doze.rawValue)))
        }
        else {
            txtBodyWeight?.text?.append(String(user.weight))
            lblActivity?.text = String(user.averageSportDurationADay)
            txtRecommended?.text?.append(String(user.recommendedDoze))
        }
    }
    
    private func constForLblRecommended() {
        lblRecommended?.translatesAutoresizingMaskIntoConstraints = false
        lblRecommended?.heightAnchor.constraint(equalToConstant: 20).isActive = true
        lblRecommended?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        lblRecommended?.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        lblRecommended?.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
    }
    
    private func constForTxtRecommended() {
        txtRecommended?.translatesAutoresizingMaskIntoConstraints = false
        txtRecommended?.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -120).isActive = true
        txtRecommended?.heightAnchor.constraint(equalToConstant: 40).isActive = true
        txtRecommended?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120).isActive = true
        txtRecommended?.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
    }
    
    private func constSegmControl() {
        setGender?.translatesAutoresizingMaskIntoConstraints = false
        setGender?.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        setGender?.heightAnchor.constraint(equalToConstant: 31).isActive = true
        setGender?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        setGender?.topAnchor.constraint(equalTo: view.topAnchor, constant: 184).isActive = true
    }
    
    private func constBtnConfirm() {
        btnConfirm?.translatesAutoresizingMaskIntoConstraints = false
        btnConfirm?.widthAnchor.constraint(equalToConstant: 160).isActive = true
        btnConfirm?.heightAnchor.constraint(equalToConstant: 45).isActive = true
        btnConfirm?.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -23).isActive = true
        btnConfirm?.topAnchor.constraint(equalTo: view.topAnchor, constant: 580).isActive = true
    }
    
    private func constBtnCancel() {
        btnCancel?.translatesAutoresizingMaskIntoConstraints = false
        btnCancel?.widthAnchor.constraint(equalToConstant: 160).isActive = true
        btnCancel?.heightAnchor.constraint(equalToConstant: 45).isActive = true
        btnCancel?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23).isActive = true
        btnCancel?.topAnchor.constraint(equalTo: view.topAnchor, constant: 580).isActive = true
    }
    
    @objc private func textFieldDidChange() {
        user.weight = self.txtBodyWeight?.text?.toDouble() ?? 0.0
        user.averageSportDurationADay = lblActivity?.text?.toDouble() ?? 0.0
        user.countRecommendedWater()
        txtRecommended?.text = "\(user.recommendedDoze)"
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
        txtRecommended?.text = "\(user.recommendedDoze)"
    }
    
    @objc private func stepperValueChange(_ sender: UIStepper) {
        lblActivity?.text = "\(Float(sender.value).description) hr"
        user.averageSportDurationADay = Double(sender.value)
        user.countRecommendedWater()
        txtRecommended?.text = "\(user.recommendedDoze)"
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
