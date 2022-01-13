//
//  ViewController.swift
//  MVVMaApp
//
//  Created by Дарья Воробей on 1/13/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet private var usernameTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var loginErrorDescriptionLabel: UILabel!
    @IBOutlet private var loginButton: UIButton!
    
    var loginViewModel: LoginViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        setupButton()
        bindData()
    }
    
    @IBAction func pressLoginButton(_ sender: Any) {
        
        loginViewModel.updateCredentials(username: usernameTextField.text!, password: passwordTextField.text!)
        
        switch loginViewModel.credentialsInput() {
        
        case .Correct:
            login()
        case .Incorrect:
            return
        }
    }
    
    func bindData() {
        loginViewModel.credentialsInputErrorMessage.bind { [weak self] in
            self?.loginErrorDescriptionLabel.isHidden = false
            self?.loginErrorDescriptionLabel.text = $0
        }
        
        loginViewModel.isUsernameTextFieldHighLighted.bind { [weak self] in
            if $0 { self?.highlightTextField((self?.usernameTextField)!)}
        }
        
        loginViewModel.isPasswordTextFieldHighLighted.bind { [weak self] in
            if $0 { self?.highlightTextField((self?.passwordTextField)!)}
        }
        
        loginViewModel.errorMessage.bind {
            guard let errorMessage = $0 else { return }
        }
    }
    
    func login() {
        loginViewModel.login()
    }
    
    func setupButton() {
        loginButton.layer.cornerRadius = 5
    }
    
    func setDelegates() {
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    func highlightTextField(_ textField: UITextField) {
        textField.resignFirstResponder()
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.cornerRadius = 3
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        loginErrorDescriptionLabel.isHidden = true
        usernameTextField.layer.borderWidth = 0
        passwordTextField.layer.borderWidth = 0
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
