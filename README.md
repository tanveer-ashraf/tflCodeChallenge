# TfL iOS Automation Coding Challenge # 

This repository contains the solution to the TfL Senior Test Analyst iOS position coding challenge. The project demonstrates automation of key user workflows using the XCUITest framework while following best practices such as the Page Object Model (POM), accessibility identifiers, and robust synchronization techniques.

## Tests Structure ##

The solution is organized as follows:

### Folders and Files ###
- **Views/**  
Contains the views, including `LoginViewController` and `MyTfLViewController`, with accessibility identifiers added to relevant UI components for testing. View instead of page is used in file names as its more relavet to Swift naming conventions.
- **Tests/**  
Contains test files organized under `LoginViewTests.swift`.
  - Tests are written using the XCUITest framework.
  - Each test runs independently and covers different scenarios in the login workflow.

## Test Scenarios ##

### 1. Failed Login ###  
Verifies that an error alert is displayed when incorrect credentials are entered.

**Steps Tested:**  
- Enter invalid username and password.
- Tap on the login button.
- Assert the error alert is displayed with the correct message.
  
### 2. Successful Login ###  
Verifies navigation to the profile screen upon entering valid credentials.

**Steps Tested:**  
- Enter valid username and password.
- Tap on the login button.
- Assert that the profile screen is displayed.
  
### 3. Profile Details Validation ###  
Ensures the correct details (name, role, and office) are displayed on the profile screen.

**Steps Tested:**  
- Login with valid credentials.
- Assert the existence and correctness of the name, role, and office labels.
  
### 4. Login and Sign-Out Flow ###  
Tests the end-to-end login and sign-out workflow.

**Steps Tested:**  

- Login with valid credentials.
- Assert the presence of the sign-out button.
- Tap on sign-out, confirm the action, and verify navigation back to the login screen.
  
## Key Features ##  

### 1. Page Object Model (POM): ###  
Each screen is encapsulated in a dedicated class (LoginViewController and MyTfLViewController) to abstract UI interactions.
Improves reusability, readability, and maintainability of tests.
### 2. Accessibility Identifiers: ###  
All UI components are assigned accessibility identifiers to ensure reliable element identification and compliance with accessibility standards.
### 3. Centralized Test Data: ###  
Test credentials are stored as constants to avoid duplication and improve maintainability.
### 4. Synchronization with waitForExistence: ###  
All tests handle UI transitions robustly using the waitForExistence(timeout:) method to ensure stability during execution.

## Known Limitations ##  

- Tests do not share login state between scenarios. Each test performs a fresh login for better isolation and reliability.
- Transition times for UI dismissal in the testLoginAndSignOut() method may vary slightly on slower devices or simulators.
  
## Future Enhancements ##  

- Implement additional tests for edge cases (e.g., empty fields, special characters in credentials).
- Integrate the test suite with CI/CD pipelines using tools like GitHub Actions or Jenkins.
- Add support for localization testing by parameterizing strings.
