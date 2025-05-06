//
//  NetworkManager.swift
//  AmericanAirlineApp
//
//  Created by Mike Tshimbadi on 5/5/25.
//

import Foundation

enum ApiError: Error {
    case invalidURL
    case invalidReponse
    case jsonParsingFailed
}


class NetworkManager {
    var results: [SearchResult] = []
    var relatedTopics: [SearchResult] = []
//
    func doApi<T: Decodable>(endPoint: String, modelName: T.Type, completion: @escaping (T?, ApiError?)-> Void) {
        
        // let query = endPoint.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        guard let url = URL(string: endPoint) else {
            completion(nil, ApiError.invalidURL)
            return
        }
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { data, reponse, error in
            guard let data = data else {
                completion(nil, ApiError.invalidReponse)
                return
            }
            do {
                let searchReponse = try JSONDecoder().decode(modelName.self, from: data)
//                self.results = searchReponse.results // Assign the results to array
//                self.relatedTopics = searchReponse.relatedTopics              
                completion(searchReponse, nil)
                print(searchReponse)
                
            } catch {
                print("\(error)")
                completion(nil, ApiError.jsonParsingFailed)
                
            }
        }.resume()
    }
}


func doApi1<T: Decodable>(endPoint: String, modelName: T.Type, success: @escaping (T) -> Void, failure: @escaping (ApiError) -> Void){
    guard let url = URL(string: endPoint) else {
        failure(ApiError.invalidURL)
        return
    }
    let urlRequest = URLRequest(url: url)
    URLSession.shared.dataTask(with: urlRequest) { data, reponse, error in
        guard let data = data else {
            failure(ApiError.invalidReponse)
            return
        }
        do {
            let searchReponse = try JSONDecoder().decode(modelName.self, from: data)
//                self.results = searchReponse.results // Assign the results to array
//                self.relatedTopics = searchReponse.relatedTopics
            success(searchReponse)
            print(searchReponse)
            
        } catch {
            print("\(error)")
            failure(ApiError.jsonParsingFailed)
            
        }
    }.resume()
}


//func doApi(searchText: String) {
//    let query = searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
//    guard let url = URL(string: "https://api.duckduckgo.com/?q=\(query)&format=json&pretty=1") else { return
//    }
//    let urlRequest = URLRequest(url: url)
//    // by default URLResquest are GET
////        urlRequest.httpMethod = "GET"
//    URLSession.shared.dataTask(with: urlRequest) { data, reponse, error in
//        
//        guard let data = data else { return }
//        do {
//            let searchReponse = try JSONDecoder().decode(SearchReponse.self, from: data)
//            print(searchReponse)
//            
//            self.results = searchReponse.results // Assign the results to array
//            self.relatedTopics = searchReponse.relatedTopics
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//               }
//        } catch {
//            
//        }
//    }.resume()
//}
//}
