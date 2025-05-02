//
//  LoginViewControllerTests.swift
//  RBSNewsTests
//
//  Created by MAC on 01/12/21.
//

import XCTest
@testable import RBSNews

class LoginViewControllerTests: XCTestCase {

    var loginViewController:LoginViewController!
    
    override func setUpWithError() throws {
        
        loginViewController = LoginViewController()
    }

    override func tearDownWithError() throws {
       loginViewController = nil
    }

    
    func testLoginValidation() {
        
        var expectedOutput = "Please input credentials."
       var actualOutput =  loginViewController.validateCredentials(userName:"", password: "")
        
        
        XCTAssertEqual(expectedOutput, actualOutput)
        
        
        expectedOutput = "Password is invalid"
        actualOutput =  loginViewController.validateCredentials(userName:"rbs", password: "afasd")
        
        
        XCTAssertEqual(expectedOutput, actualOutput)
        
        expectedOutput = "Username is invalid"
        actualOutput =  loginViewController.validateCredentials(userName:"afa", password: "1234")
        
        
        XCTAssertEqual(expectedOutput, actualOutput)
        
        
        
        actualOutput =  loginViewController.validateCredentials(userName:"rbs", password: "1234")
        
        
        XCTAssertNil(actualOutput)
    }

}
