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
    
 // it's called before the function is executed
    override func setUpWithError() throws {
        
        loginViewController = LoginViewController()
    }
    
    // it's called after the function is executed
    override func tearDownWithError() throws {
       loginViewController = nil
    }

    
    func testLoginValidation() {
        
        
    }
}
