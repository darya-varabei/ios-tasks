//
//  SceneDelegate.swift
//  MVVMaApp
//
//  Created by Дарья Воробей on 1/13/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        
//        if let loginVC = self.window?.rootViewController as? LoginViewController {
//            let loginManager = LoginManager()
//            let loginViewModel = LoginViewModel(loginManager: loginManager)
//            loginVC.loginViewModel = loginViewModel
//        }
    }
}

