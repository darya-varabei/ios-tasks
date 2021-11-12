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
        self.constForLblRecommended()
        self.constForTxtRecommended()
        self.constSegmControl()
        self.constBtnConfirm()
        self.constBtnCancel()
        self.setUserParameters()
        
        self.setGender?.addTarget(self, action: #selector(genderValueChange), for: .valueChanged)
        self.txtBodyWeight?.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        self.stepperActivity?.addTarget(self, action: #selector(stepperValueChange), for: .valueChanged)
        self.setGender?.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    private func setUserParameters() {
        self.txtBodyWeight?.text?.append(String(self.user.weight))
        self.lblActivity?.text = "\(self.user.averageSportDurationADay)"
        self.txtRecommended?.text?.append(String(self.user.recommendedDoze))
    }
    
    private func constForLblRecommended() {
        self.lblRecommended?.translatesAutoresizingMaskIntoConstraints = false
        self.lblRecommended?.heightAnchor.constraint(equalToConstant: 20).isActive = true
        self.lblRecommended?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        self.lblRecommended?.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        self.lblRecommended?.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
    }
    
    private func constForTxtRecommended() {
        self.txtRecommended?.translatesAutoresizingMaskIntoConstraints = false
        self.txtRecommended?.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -120).isActive = true
        self.txtRecommended?.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.txtRecommended?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120).isActive = true
        self.txtRecommended?.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
    }
    
    private func constSegmControl() {
        self.setGender?.translatesAutoresizingMaskIntoConstraints = false
        self.setGender?.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        self.setGender?.heightAnchor.constraint(equalToConstant: 31).isActive = true
        self.setGender?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        self.setGender?.topAnchor.constraint(equalTo: view.topAnchor, constant: 184).isActive = true
    }
    
    private func constBtnConfirm() {
        self.btnConfirm?.translatesAutoresizingMaskIntoConstraints = false
        self.btnConfirm?.widthAnchor.constraint(equalToConstant: 160).isActive = true
        self.btnConfirm?.heightAnchor.constraint(equalToConstant: 45).isActive = true
        self.btnConfirm?.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -23).isActive = true
        self.btnConfirm?.topAnchor.constraint(equalTo: view.topAnchor, constant: 580).isActive = true
    }
    
    private func constBtnCancel() {
        self.btnCancel?.translatesAutoresizingMaskIntoConstraints = false
        self.btnCancel?.widthAnchor.constraint(equalToConstant: 160).isActive = true
        self.btnCancel?.heightAnchor.constraint(equalToConstant: 45).isActive = true
        self.btnCancel?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23).isActive = true
        self.btnCancel?.topAnchor.constraint(equalTo: view.topAnchor, constant: 580).isActive = true
    }
    
    @objc private func textFieldDidChange() {
        user.weight = self.txtBodyWeight?.text?.toDouble() ?? 0.0
        user.averageSportDurationADay = self.lblActivity?.text?.toDouble() ?? 0.0
        user.countRecommendedWater()
        self.txtRecommended?.text = "\(user.recommendedDoze)"
    }
    
    @objc private func genderValueChange() {
        
        if self.setGender?.selectedSegmentIndex == 0 {
            user.gender = .male
        }
        else if self.setGender?.selectedSegmentIndex == 1 {
            user.gender = .female
        }
        else {
            user.gender = .other
        }
        user.countRecommendedWater()
        self.txtRecommended?.text = "\(user.recommendedDoze)"
    }
    
    @objc private func stepperValueChange(_ sender: UIStepper) {
        self.lblActivity?.text = "\(Float(sender.value).description) hr"
        user.averageSportDurationADay = Double(sender.value)
        user.countRecommendedWater()
        self.txtRecommended?.text = "\(user.recommendedDoze)"
    }
    
    @IBAction func btnConfirmUser(_ sender: Any) {
       
        UserDefaults.standard.setValue(user.weight, forKey: "bodyweight")
        UserDefaults.standard.setValue(user.averageSportDurationADay, forKey: "activity")
        UserDefaults.standard.setValue(user.recommendedDoze, forKey: "doze")
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelUserData(_ sender: Any) {
       
        user.weight = UserDefaults.standard.double(forKey: "bodyweight")
        user.averageSportDurationADay = UserDefaults.standard.double(forKey: "activity")
        user.recommendedDoze = UserDefaults.standard.double(forKey: "doze")
        navigationController?.popViewController(animated: true)
    }
}

extension String {
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
}
