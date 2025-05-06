//
//  SearchReponse.swift
//  AmericanAirlineApp
//
//  Created by Mike Tshimbadi on 5/2/25.
//

import Foundation

// parsing data by creating a model
struct SearchReponse: Decodable {
    let results: [SearchResult]
    let relatedTopics: [SearchResult]
    
    // create var to make the model our best practice
    enum CodingKeys: String, CodingKey { // emun name HAS TO be CodingKeys
        case results = "Results"
        case relatedTopics = "RelatedTopics"
    }
}

struct SearchResult: Decodable {
    let firstURL: String
    let result: String
    let text: String
    
    enum CodingKeys: String, CodingKey { // emun name HAS TO be CodingKeys
        case firstURL = "FirstURL"
        case result = "Result"
        case text = "Text"
        
    }
}
