//
//  NewsViewModel.swift
//  RBSNews
//
//  RBS Tests Project on 12/10/20.
//

import Foundation

class NewsViewModel {
    
    init() {}
    
    func parseJSON(_ completion: @escaping (News?) -> Void) {
        if let url = Bundle.main.url(forResource: "News", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(News.self, from: data)
                completion(jsonData)
            } catch {
                print("error while decoding the JSON data")
                completion(nil)
            }
        }
    }
}
