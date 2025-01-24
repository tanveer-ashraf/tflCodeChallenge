//
//  MyTfLViewController.swift
//  SignInAppUITests
//
//  Created by Tanveer Ashraf on 23/01/2025.
//

import XCTest

class MyTfLViewController {
    private let app: XCUIApplication
    
    var nameLabel: XCUIElement { app.staticTexts[AccessibilityIdentifiers.Profile.nameLabel] }
    var roleLabel: XCUIElement { app.staticTexts[AccessibilityIdentifiers.Profile.roleLabel] }
    var officeLabel: XCUIElement { app.staticTexts[AccessibilityIdentifiers.Profile.officeLabel] }
    var signOutButton: XCUIElement { app.buttons[AccessibilityIdentifiers.Profile.signOutButton] }
    
    init(app: XCUIApplication) {
        self.app = app
    }
}
