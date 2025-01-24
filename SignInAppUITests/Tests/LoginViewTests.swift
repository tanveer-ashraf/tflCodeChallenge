//
//  LoginTests.swift
//  SignInAppUITests
//
//  Created by Tanveer Ashraf on 23/01/2025.
//

import XCTest

final class LoginViewTests: XCTestCase {
    var app: XCUIApplication!
    var loginView: LoginViewController!
    var myTfLView: MyTfLViewController!
    
    // Centralized credentials
    private let validUsername = "emma@tfl.gov.uk"
    private let validPassword = "password123"
    private let invalidUsername = "wrong@tfl.gov.uk"
    private let invalidPassword = "wrongpassword"
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        loginView = LoginViewController(app: app)
        myTfLView = MyTfLViewController(app: app)
    }
    
    override func tearDown() {
        let screenshot = XCUIScreen.main.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.lifetime = .deleteOnSuccess
        add(attachment)
        app.terminate()
    }
    
    func testFailedLogin() {
        // Use constants for invalid credentials
        loginView.login(username: invalidUsername, password: invalidPassword)
        XCTAssertTrue(loginView.loginErrorAlert.exists, "Error alert should be displayed for failed login")
    }
    
    func testSuccessfulLogin() {
        // Use constants for valid credentials
        loginView.login(username: validUsername, password: validPassword)
        XCTAssertTrue(myTfLView.nameLabel.waitForExistence(timeout: 5), "Name label should exist after successful login")
    }
    
    func testElementsExistOnMyTfLPage() {
        // Login with valid credentials
        loginView.login(username: validUsername, password: validPassword)
        
        // Validate elements on the MyTfL page
        XCTAssertTrue(myTfLView.nameLabel.exists, "Name label should be visible")
        XCTAssertEqual(myTfLView.nameLabel.label, "Emma Smith")
        
        XCTAssertTrue(myTfLView.roleLabel.exists, "Role label should be visible")
        XCTAssertEqual(myTfLView.roleLabel.label, "Senior Test Analyst")
        
        XCTAssertTrue(myTfLView.officeLabel.exists, "Office label should be visible")
        XCTAssertEqual(myTfLView.officeLabel.label, "Pier Walk")
    }
    
    func testLoginAndSignOut() {
        // Login with valid credentials
        loginView.login(username: validUsername, password: validPassword)
        XCTAssertTrue(myTfLView.signOutButton.exists, "Sign out button should exist on MyTfL page")
        
        // Perform sign out
        myTfLView.signOutButton.tap()
        app.alerts["Sign Out?"].buttons["Sign Out"].tap()
        
        // Wait for the login screen to fully appear
        XCTAssertTrue(loginView.usernameTextField.waitForExistence(timeout: 5), "After signing out, the login screen should appear")
    }
}

