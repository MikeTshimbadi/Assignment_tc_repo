//
//  CountryField.swift
//  CountryDataApp
//
//  Created by Mike Tshimbadi on 4/28/25.
//
// country model
import Foundation



struct Country: Decodable {
    let capital: String?
    let code: String?
    let currency: Currency?
    let flag: String?
    let language: Language?
    let name: String?
    let region: String?
}

struct Currency: Decodable {
    let code: String?
    let name: String?
    let symbol: String?
}

struct Language: Decodable {
    let code: String?
    let name: String?
}
