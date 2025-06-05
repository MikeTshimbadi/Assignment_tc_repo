//
//  Country.swift
//  CountryApiProg
//
//  Created by Mike Tshimbadi on 5/26/25.
//

import Foundation
import UIKit

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

