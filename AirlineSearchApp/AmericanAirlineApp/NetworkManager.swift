//
//  NetworkManager.swift
//  AmericanAirlineApp
//
//  Created by Mike Tshimbadi on 5/5/25.
//

import Foundation


enum ApiError: Error {
    case invalidURL
    case invalidResponse
    case jsonParsingFailed
}


enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}


protocol Request {
    var baseUrl: String { get }
    var path: String { get }
    var httpMethod: HttpMethod { get }
    var params: [String: String]? { get }
    var header: [String: String]? { get }

    func createRequest() -> URLRequest?
    
}

extension Request {
    func createRequest() -> URLRequest? {
        var urlComponents =  URLComponents(string: baseUrl + path)
        if httpMethod == .get {
            urlComponents?.queryItems = params?.map {
                URLQueryItem(name: $0.key, value: $0.value)
            }
        }
        guard let url = urlComponents?.url else {
            return nil
        }
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.allHTTPHeaderFields = header
        
        if httpMethod == .post {
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: params ?? [:], options: [])
        }
        return urlRequest
    }    
}

protocol Servicable {
    func execute<T: Decodable>(request: some Request, modelName: T.Type) async throws -> T
    
    func doApi<T: Decodable>(endPoint: String, modelName: T.Type, completion: @escaping (Result<T, ApiError>)-> Void)
}


class NetworkManager: Servicable {
    
    var results: [SearchResult] = []
    var relatedTopics: [SearchResult] = []
    
    func doApi<T: Decodable>(endPoint: String, modelName: T.Type, completion: @escaping (Result<T, ApiError>) -> Void) {
        guard let url = URL(string: endPoint) else {
            completion(.failure(ApiError.invalidURL))
            return
        }
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { data, reponse, error in
            guard let data = data else {
                completion(.failure(ApiError.invalidResponse))
                return
            }
            do {
                let searchReponse = try JSONDecoder().decode(modelName.self, from: data)
//                self.results = searchReponse.results // Assign the results to array
//                self.relatedTopics = searchReponse.relatedTopics
                completion(.success(searchReponse))
                print(searchReponse)

            } catch {
                print("\(error)")
                completion(.failure(ApiError.jsonParsingFailed))

            }
        }.resume()
    
    }
    
    func execute<T: Decodable>(request: some Request, modelName: T.Type) async throws -> T {
        guard let urlRequest = request.createRequest() else {
            throw ApiError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        // Optionally validate HTTP response here
        guard let httpResponse = response as? HTTPURLResponse,
              200..<300 ~= httpResponse.statusCode else {
            throw ApiError.invalidResponse
        }

        do {
            return try JSONDecoder().decode(modelName.self, from: data)
        } catch {
            throw ApiError.jsonParsingFailed
        }


    }
    

        // let query = endPoint.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
}


// -----------------------------------------------

//    func execute<T: Decodable>(request: Request, modelName: T.Type, completion: @escaping (Result<T, ApiError>)-> Void)
//    
//    func doApi<T: Decodable>(endPoint: String, modelName: T.Type, completion: @escaping (Result<T, ApiError>)-> Void)

//class NetworkManager: Servicable {
//    var results: [SearchResult] = []
//    var relatedTopics: [SearchResult] = []
////
//    func doApi<T: Decodable>(endPoint: String, modelName: T.Type, completion: @escaping (T?, ApiError?)-> Void) {
//        
//        // let query = endPoint.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
//        guard let url = URL(string: endPoint) else {
//            completion(nil, ApiError.invalidURL)
//            return
//        }
//        let urlRequest = URLRequest(url: url)
//        URLSession.shared.dataTask(with: urlRequest) { data, reponse, error in
//            guard let data = data else {
//                completion(nil, ApiError.invalidReponse)
//                return
//            }
//            do {
//                let searchReponse = try JSONDecoder().decode(modelName.self, from: data)
////                self.results = searchReponse.results // Assign the results to array
////                self.relatedTopics = searchReponse.relatedTopics              
//                completion(searchReponse, nil)
//                print(searchReponse)
//                
//            } catch {
//                print("\(error)")
//                completion(nil, ApiError.jsonParsingFailed)
//                
//            }
//        }.resume()
//    }
    
//    func execute<T>(request: any Request, modelName: T.Type) async throws -> T where T : Decodable {
//        
//        guard let urlRequest = request.createRequest() else {
//            throw ApiError.invalidURL
//        }
//        
//        let (data, response) =  try await URLSession.shared.data(for: urlRequest)
//        
//        return try JSONDecoder().decode(
//            modelName.self, from: data)
//    }
//}
//
//
//func doApi1<T: Decodable>(endPoint: String, modelName: T.Type, success: @escaping (T) -> Void, failure: @escaping (ApiError) -> Void){
//    guard let url = URL(string: endPoint) else {
//        failure(ApiError.invalidURL)
//        return
//    }
//    let urlRequest = URLRequest(url: url)
//    URLSession.shared.dataTask(with: urlRequest) { data, reponse, error in
//        guard let data = data else {
//            failure(ApiError.invalidReponse)
//            return
//        }
//        do {
//            let searchReponse = try JSONDecoder().decode(modelName.self, from: data)
////                self.results = searchReponse.results // Assign the results to array
////                self.relatedTopics = searchReponse.relatedTopics
//            success(searchReponse)
//            print(searchReponse)
//            
//        } catch {
//            print("\(error)")
//            failure(ApiError.jsonParsingFailed)
//            
//        }
//    }.resume()
//}


// -------------------------------

//class ServiceManager: Servicable {
//    func execute<T>(request: any Request, modelName: T.Type) async throws -> T where T : Decodable {
//        
//        guard let urlRequest = request.createRequest() else {
//            throw ApiError.invalidURL
//        }
//        
//        let (data, response) =  try await URLSession.shared.data(for: urlRequest)
//        
//        return try JSONDecoder().decode(
//            modelName.self, from: data)
//    }
//    
//}
