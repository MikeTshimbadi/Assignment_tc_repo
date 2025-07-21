//
//  NBAJsonModel.swift
//  NBAapp
//
//  Created by Mike Tshimbadi on 6/12/25.
//

import Foundation

struct NBAJsonModel: Decodable, Identifiable {
    var id: String { teamName }
    
    let teamAbv: String
    let teamCity: String
    let teamName: String
    let conference: String
    let espnLogo1: String?
    var image: URL? { espnLogo1.flatMap(URL.init) }
    
    enum CodingKeys: String, CodingKey {
        case teamAbv = "teamAbv"
        case teamCity = "teamCity"
        case teamName = "teamName"
        case conference = "conference"
        case espnLogo1  = "espnLogo1"
    }
}

struct NBAResponse: Decodable {
    let statusCode: Int
    let body: [NBAJsonModel]
}

struct Roster: Decodable, Identifiable {
    var id: String { teamID }
    let team: String
    let teamID: String
    let longName: String
    let pos: String
    
    enum CodingKeys: String, CodingKey {
        case team = "team"
        case teamID = "teamID"
        case longName = "longName"
        case pos = "pos"
    }
}

struct RosterResponse: Decodable {
    let statusCode: Int
    let body: [Roster]
}


