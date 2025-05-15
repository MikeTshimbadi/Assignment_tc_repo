//
//  SearchRequest.swift
//  AmericanAirlineApp
//
//  Created by Mike Tshimbadi on 5/13/25.
//

import Foundation

struct SearchRequest: Request {
    var baseUrl: String = "https://api.duckduckgo.com"
    var path: String = ""
    var httpMethod: HttpMethod = .post
    var params: [String : String]?
    var header: [String : String]? = nil
    

    static func createRequest(text: String)-> SearchRequest {
        let param = ["q":text, "format":"json", "pretty":"1"]
        let request = SearchRequest(params: param)
        return request
    }
}

struct DuckDuckGoRequest: Request {
    var baseUrl: String = "https://api.duckduckgo.com"
    var path: String = ""
    var httpMethod: HttpMethod = .get
    var params: [String: String]?
    var header: [String: String]? = nil

    init(query: String) {
        self.params = [
            "q": query,
            "format": "json",
            "pretty": "1"
        ]
    }
}

struct DuckDuckGoRequest1: Request {
    var baseUrl: String
    
    var path: String
    
    var httpMethod: HttpMethod
    
    var params: [String : String]?
    
    var header: [String : String]?
    
    let query: String

    func createRequest(query: String) -> URLRequest? {
        
//        let query: String
        guard let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: "https://api.duckduckgo.com/?q=\(encodedQuery)&format=json&pretty=1") else {
            return nil
        }
        return URLRequest(url: url)
    }
}


