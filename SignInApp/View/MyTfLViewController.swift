//
//  LoginViewController.swift
//  SignInApp
//
//  Created by dan on 12/07/2022.
//

import Foundation
import UIKit


class MyTfLViewController: UIViewController {
    
    // MARK: - UI Elements
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var roleLabel: UILabel!
    @IBOutlet private weak var officeLabel: UILabel!
    @IBOutlet private weak var signOutButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set Accessibility Identifiers
        setupAccessibilityIdentifiers()
    }
    
    private func setupAccessibilityIdentifiers() {
        nameLabel.accessibilityIdentifier = AccessibilityIdentifiers.Profile.nameLabel
        roleLabel.accessibilityIdentifier = AccessibilityIdentifiers.Profile.roleLabel
        officeLabel.accessibilityIdentifier = AccessibilityIdentifiers.Profile.officeLabel
        signOutButton.accessibilityIdentifier = AccessibilityIdentifiers.Profile.signOutButton
    }
    
    // MARK: - Actions
    @IBAction private func signOutButtonPressed(_ sender: UIButton) {
        let alert = UIAlertController(
            title: "Sign Out?",
            message: "Are you sure you want to sign out?",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Sign Out", style: .default, handler: { _ in
            self.dismiss(animated: true)
        }))
        
        present(alert, animated: true)
    }
}
