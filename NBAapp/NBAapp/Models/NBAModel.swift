//
//  NBAModel.swift
//  NBAapp
//
//  Created by Mike Tshimbadi on 6/12/25.
//

import Foundation
// https://tank01-fantasy-stats.p.rapidapi.com/getNBATeams?schedules=false&rosters=false&statsToGet=averages&topPerformers=true&teamStats=true

//struct NBARequest: Request {
//    var baseUrl: String
//    var path: String
//    var httpMethod: HttpMethod
//    var header: [String : String]?
//    var params: [String : String]?
//   
//
//    init() {
//        self.baseUrl = "https://tank01-fantasy-stats.p.rapidapi.com"
//        self.path = "/getNBATeams/"
//        self.httpMethod = .get
//        self.header = [
//            "x-rapidapi-key": "87a83c11c0msh27c8127038ae970p142f15jsn2ca0a35f3a59",
//            "x-rapidapi-host": "tank01-fantasy-stats.p.rapidapi.com"
//        ]
//    }
//}

struct APIRequest: Request {
    var baseUrl: String
    var path: String
    var httpMethod: HttpMethod
    var header: [String : String]?
    var params: [String : String]?
   

    init(
        baseUrl: String,
        path: String,
        httpMethod: HttpMethod = .get,
        header: [String : String]? = nil,
        params: [String : String]? = nil
    ) {
        self.baseUrl = baseUrl
        self.path = path
        self.httpMethod = httpMethod
        self.header = header
        self.params = params
    }
}
