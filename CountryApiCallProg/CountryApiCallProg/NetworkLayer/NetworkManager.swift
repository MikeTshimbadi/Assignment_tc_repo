//
//  NetworkManager.swift
//  CountryApiProg
//
//  Created by Mike Tshimbadi on 5/26/25.
//

import Foundation

class NetworkManager {
    
    var delegate: CountryViewControllerProtocol?
    var countries: [Country] = []
    func doApi() {
        guard
            let url = URL(
                string:
                    "https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json") else {
            return
        }
        
        var urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else { return }
            do {
                let countries = try JSONDecoder().decode(
                    [Country].self, from: data)
                
                self.delegate?.refreshUI()
                
            } catch {
                
            }
        }.resume()
        
    }
}
