//
//  RBSNewsTests.swift
//  RBSNewsTests
//
//  RBS Tests Project on 12/10/20.
//
// @testable: will  make all internal functions, classes, variables as public
import XCTest
@testable import RBSNews

class RBSNewsTests: XCTestCase {
    
    let newsViewModel = NewsViewModel()
    
    override func setUpWithError() throws {
    }
    
    override func tearDownWithError() throws {
    }
    
    func testNewsModelTotalResults() {
        newsViewModel.parseJSON { (news) in
            if let news = news {
                XCTAssertEqual(news.totalResults, 70, "Total results is not matching!")
            }
        }
    }
    
    func testNewsModelArticles() {
        newsViewModel.parseJSON { (news) in
            if let news = news, let articles = news.articles {
                XCTAssertEqual(articles.count, 20, "Articless count is not matching!")
            }
        }
    }
    
//    func setUp() {
//    }
//    
//    func tearDown() {
//    }

    func testDivide()  {
        let actualOuput = try! LoginViewController().divide(dividend: 10, divisor: 2)
        let excceptedOuput = 5
        XCTAssertEqual(actualOuput, excceptedOuput)
    }
    
    func testDivide_zero()  {
        do {
            let actualOuput = try LoginViewController().divide(dividend: 10, divisor: 0)
        } catch {
            let excceptedOuput = 0
//            XCTAssertEqual(actualOuput, error as! CustomError)
        }
    }
    
    func testLoginButtonClicked() {
        
    }
    
    func testloginButtonClicked_validation() {
        let expectedUser = LoginViewController().expectedUsername
        let expectedPassword = LoginViewController().expectedPassword
        
        let actualOutput = LoginViewController().loginButtonClicked(username: expectedUser, password: expectedPassword)
        
        XCTAssertEqual(expectedUser, actualOutput)
        
    }
}
