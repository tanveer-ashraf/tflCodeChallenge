//
//  LoginViewController.swift
//  SignInApp
//
//  Created by dan on 12/07/2022.
//

import Foundation
import UIKit


class LoginViewController: UIViewController {
    // MARK: - UI Elements
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var signInButton: UIButton!
    
    // MARK: - ViewModel
    private let viewModel = LoginViewModel()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set Accessibility Identifiers
        setupAccessibilityIdentifiers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        clearFields()
    }
    
    // MARK: - UI Setup
    private func setupAccessibilityIdentifiers() {
        usernameTextField.accessibilityIdentifier = AccessibilityIdentifiers.Login.usernameTextField
        passwordTextField.accessibilityIdentifier = AccessibilityIdentifiers.Login.passwordTextField
        signInButton.accessibilityIdentifier = AccessibilityIdentifiers.Login.signInButton
    }
    
    private func clearFields() {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    
    // MARK: - Actions
    @IBAction private func signInButtonPressed(_ sender: UIButton) {
        guard let username = usernameTextField.text, let password = passwordTextField.text else { return }
        
        if viewModel.validateCredentials(username: username, password: password) {
            performSegue(withIdentifier: "goToWelcomePage", sender: nil)
        } else {
            presentErrorAlert()
        }
    }
    
    private func presentErrorAlert() {
        let alert = UIAlertController(
            title: "Login Error",
            message: "Looks like either your Username or Password is incorrect. Please try again.",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Done", style: .cancel))
        present(alert, animated: true)
    }
    
}
