//
//  ServiceManager.swift
//  AirlineSearch
//
//  Created by Mac on 05/05/25.
//

import Foundation


//enum ResultType<T, Z: Error> {
//    case success(T)
//    case failure(Z)
//}
 
// Result type came in swift 5.0


// REST API call -> CRUD operations

// create  //  POST
// read    //  GET
// update  //  PUT
// delete  //  DELETE

// Request

// baseUrl = "https://api.duckduckgo.com"
// path = ""
// httpMethod
// parameters = ["q": "American Airlines", "format": "json", "pretty", "1"]
// Header = is dictionary
// httpBody =


enum ApiError: Error {
   case invalidUrl
   case invalidResponse
    case jsonParsingFailed(String)
}

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}


protocol Request {
    var baseUrl: String { get set }
    var path: String { get set }
    var httpMethod: HttpMethod { get set }
    var params: [String: String]? { get set }
    var header: [String: String]? { get set }
}

extension Request {
    func createRequest()-> URLRequest? {
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
    
    func execute<T: Decodable>(request: Request, modelName: T.Type, completion: @escaping (Result<T, ApiError>)-> Void)
    
    func doApi<T: Decodable>(endPoint: String, modelName: T.Type, completion: @escaping (Result<T, ApiError>)-> Void)
    
    func execute<T: Decodable>(request: Request, modelName: T.Type)async throws -> T

}

class ServiceManager: Servicable {
    func execute<T>(request: any Request, modelName: T.Type) async throws -> T where T : Decodable {
        
        guard let urlRequest = request.createRequest() else {
             throw ApiError.invalidUrl
        }
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        return try JSONDecoder().decode(modelName.self, from: data)
        
    }
    
    func execute<T>(request: any Request, modelName: T.Type, completion: @escaping (Result<T, ApiError>) -> Void) where T : Decodable {
        
        guard let urlRequest = request.createRequest() else {
            completion(.failure(ApiError.invalidUrl))
            return
        }
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else {
                completion(.failure(ApiError.invalidResponse))
                return
            }
            do {
               let searchResponse = try JSONDecoder().decode(
                    modelName.self, from: data)

                completion(.success(searchResponse))
                print(searchResponse)

            } catch {
                completion(.failure(ApiError.jsonParsingFailed(error.localizedDescription)))
            }
        }.resume()
    }
    
    
    func doApi<T: Decodable>(endPoint: String, modelName: T.Type, completion: @escaping (Result<T, ApiError>)-> Void) {
        guard
            let url = URL(string: endPoint)
        else {
            completion(.failure(ApiError.invalidUrl))
            return
        }

        var urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in

            guard let data = data else {
                completion(.failure(ApiError.invalidResponse))

                return
            }

            do {

                let searchResponse = try JSONDecoder().decode(
                    modelName.self, from: data)

                completion(.success(searchResponse))
                print(searchResponse)

            } catch {
                completion(.failure(ApiError.jsonParsingFailed(error.localizedDescription)))
            }
        }.resume()
    }
    
    
    func doApi<T: Decodable>(endPoint: String, modelName: T.Type, completion: @escaping (T?, ApiError?)-> Void) {
        guard
            let url = URL(string: endPoint)
        else {
            completion(nil, ApiError.invalidUrl)
            return
        }

        var urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in

            guard let data = data else {
                completion(nil, ApiError.invalidResponse)
                return
            }

            do {

                let searchResponse = try JSONDecoder().decode(
                    modelName.self, from: data)

                completion(searchResponse, nil)
                print(searchResponse)

            } catch {
                completion(nil, ApiError.jsonParsingFailed(error.localizedDescription))
            }
        }.resume()
    }
    
    func doApi1<T: Decodable>(endPoint: String, modelName: T.Type, success: @escaping (T)-> Void, failure: @escaping (ApiError)-> Void) {
        guard
            let url = URL(string: endPoint)
        else {
            failure(ApiError.invalidUrl)
            return
        }

        var urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in

            guard let data = data else {
                failure(ApiError.invalidResponse)
                return
            }

            do {

                let searchResponse = try JSONDecoder().decode(
                    modelName.self, from: data)

                success(searchResponse)
                print(searchResponse)

            } catch {
                failure(ApiError.jsonParsingFailed(error.localizedDescription))
            }
        }.resume()
    }
}
