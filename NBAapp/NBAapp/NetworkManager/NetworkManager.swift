//
//  NetworkManager.swift
//  NBAapp
//
//  Created by Mike Tshimbadi on 6/12/25.
//

import Foundation

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
    func createRequest() -> URLRequest? {
        // Construct URL components from base URL and path
        var urlComponents = URLComponents(string: baseUrl + path)
        
        // If the method is GET, encode parameters into the query string
        if httpMethod == .get {
            urlComponents?.queryItems = params?.map {
                URLQueryItem(name: $0.key, value: $0.value)
            }
        }
        // Safely unwrap the constructed URL
        guard let url = urlComponents?.url else {
            return nil
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.allHTTPHeaderFields = header
        return urlRequest
    }

}
protocol Servicable {
    func execute<T: Decodable>(request: Request, modelName: T.Type)async throws -> T
    func fetchTeams() async throws -> [NBAJsonModel]
    func fetchRoster() async throws -> [Roster]
}

class NetworkManager: Servicable {
    func execute<T>(request: any Request, modelName: T.Type) async throws -> T where T : Decodable {
        
        guard let urlRequest = request.createRequest() else {
             throw ApiError.invalidUrl
        }
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        return try JSONDecoder().decode(modelName.self, from: data)
        
    }
    
    @MainActor
    func fetchTeams() async throws -> [NBAJsonModel] {
        let NBARequest = APIRequest(
            baseUrl: "https://tank01-fantasy-stats.p.rapidapi.com",
            path: "/getNBATeams/",
            header: [
                "x-rapidapi-key": "87a83c11c0msh27c8127038ae970p142f15jsn2ca0a35f3a59",
                "x-rapidapi-host": "tank01-fantasy-stats.p.rapidapi.com"
                ]
        )
        let response = try await execute(request: NBARequest, modelName: NBAResponse.self)
        return response.body
    }
    
    @MainActor
    func fetchRoster() async throws -> [Roster] {
        let rosterRequest = APIRequest(
            baseUrl: "https://tank01-fantasy-stats.p.rapidapi.com",
            path: "/getNBAPlayerList/",
            header: [
                "x-rapidapi-key": "87a83c11c0msh27c8127038ae970p142f15jsn2ca0a35f3a59",
                "x-rapidapi-host": "tank01-fantasy-stats.p.rapidapi.com"
            ]
        )
        let response = try await execute(request: rosterRequest, modelName: RosterResponse.self)
        return response.body
    }

}
