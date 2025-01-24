//
//  LoginViewController.swift
//  SignInAppUITests
//
//  Created by Tanveer Ashraf on 23/01/2025.
//

import XCTest

class LoginViewController {
    private let app: XCUIApplication
    
    var usernameTextField: XCUIElement { app.textFields[AccessibilityIdentifiers.Login.usernameTextField] }
    var passwordTextField: XCUIElement { app.secureTextFields[AccessibilityIdentifiers.Login.passwordTextField] }
    var signInButton: XCUIElement { app.buttons[AccessibilityIdentifiers.Login.signInButton] }
    var loginErrorAlert: XCUIElement { app.alerts["Login Error"] }
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    func login(username: String, password: String) {
        usernameTextField.tap()
        usernameTextField.typeText(username)
        
        passwordTextField.tap()
        passwordTextField.typeText(password)
        
        signInButton.tap()
    }
}
