//
//  LoginViewModel.swift
//  SignInApp
//
//  Created by Tanveer Ashraf on 24/01/2025.
//

import Foundation

class LoginViewModel {
    private let validUsername = "emma@tfl.gov.uk"
    private let validPassword = "password123"

    func validateCredentials(username: String, password: String) -> Bool {
        return username == validUsername && password == validPassword
    }
}
