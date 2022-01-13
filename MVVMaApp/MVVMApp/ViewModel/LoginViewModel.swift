//
//  LoginViewModel.swift
//  MVVMaApp
//
//  Created by Дарья Воробей on 1/13/22.
//

import Foundation
import UIKit

class LoginViewModel {
    
    private let loginManager: LoginManager
    
    private var credentials = UserCredentials() {
        didSet {
            username = credentials.username
            password = credentials.password
        }
    }
    
    private var username = ""
    private var password = ""
    
    var credentialsInputErrorMessage: Observable<String> = Observable("")
    var isUsernameTextFieldHighLighted: Observable<Bool> = Observable(false)
    var isPasswordTextFieldHighLighted: Observable<Bool> = Observable(false)
    var errorMessage: Observable<String?> = Observable(nil)
    
    
    init(loginManager: LoginManager) {
        self.loginManager = loginManager
    }
    
    func updateCredentials(username: String, password: String, otp: String? = nil) {
        credentials.username = username
        credentials.password = password
    }
    
    
    func login() {
        //        loginManager.loginWithCredentials(username: username, password: password) { [weak self] (error) in
        //            guard let error = error else {
        //                return
        //            }
        //
        //            self?.errorMessage.value = error.localizedDescription
        //        }
    }
    
    
    func credentialsInput() -> CredentialsInputStatus {
        if username.isEmpty && password.isEmpty {
            credentialsInputErrorMessage.value = "Please provide username and password."
            return .Incorrect
        }
        if username.isEmpty {
            credentialsInputErrorMessage.value = "Username field is empty."
            isUsernameTextFieldHighLighted.value = true
            return .Incorrect
        }
        if password.isEmpty {
            credentialsInputErrorMessage.value = "Password field is empty."
            isPasswordTextFieldHighLighted.value = true
            return .Incorrect
        }
        return .Correct
    }
}
