//
//  CountryAppTests.swift
//  CountryAppTests
//
//  Created by Mike Tshimbadi on 7/2/25.
//

import XCTest
@testable import CountryApp

final class CountryAppTests: XCTestCase {

    private var country: [Country] = []
    
    override func setUp() {
        super.setUp()
        // Initialize the country array with sample data
        country = [
            Country(
                capital: "Paris ",
                code: "France",
                currency: Currency(code: "Eu", name: "Euro", symbol: "€"),
                flag: "🇫🇷",
                language: Language(code: "fr", name: "French"),
                name: "France",
                region: "EU"),
            Country(
                capital: "Washigthon D.C",
                code: "USA",
                currency: Currency(code: "USD", name: "US Dollar", symbol: "$"),
                flag: "🇺🇸",
                language: Language(code: "en", name: "English"),
                name: "United Stated of America",
                region: "NA"),
                    ]
    }
    
    func testnumberOfCountries() {
        let numberOfCountries = country.count
        
        XCTAssertEqual(numberOfCountries, 2, "The number of countries should be 2")
    }

}
