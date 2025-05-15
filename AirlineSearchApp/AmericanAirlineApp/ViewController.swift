//
//  ViewController.swift
//  AmericanAirlineApp
//
//  Created by Mike Tshimbadi on 4/28/25.
//
// https://api.duckduckgo.com/?q=American+Airlines&format=json&pretty=1
// https://api.duckduckgo.com/booking/
// https://api.duckduckgo.com/profile/
// REST api call -> CRUD operation

// Create  // POST
// Read // GET
// Update // PUT
// Delete // DELETE


// this represent GET Request
// baseURL = "https://api.duckduckgo.com "
// path = ""
// parameters = starts with ? and is dictionary-> ["q": is parameter name "American Airlines", "format": json, "pretty": "1"]
// Header = is a dictionary
// http Method
import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var results: [SearchResult] = []
    var relatedTopics: [SearchResult] = []
    var searchBar = UISearchBar()
    let networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        searchBar.delegate = self
        searchBar.placeholder = "Search..."
        tableView.tableHeaderView = searchBar
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return results.count
        } else if section == 1 {
            return relatedTopics.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? NameLabelTableViewCell
        
        if indexPath.section == 0 {
            let result = results[indexPath.row]
            cell?.nameLabel.text = result.text
            cell?.urlLabel.text = result.firstURL
        } else if indexPath.section == 1 {
            let topic = relatedTopics[indexPath.row]
            cell?.nameLabel.text = topic.text
            cell?.urlLabel.text = topic.firstURL
        }
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Results"
        } else if section == 1 {
            return "RelatedTopics"
        } else {
            return " "
        }
    }
    
    func performSearch(for query: String?) {
        guard let query = query, !query.isEmpty else { return }
        
        let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let url = "https://api.duckduckgo.com/?q=\(encodedQuery)&format=json&pretty=1"
        
        Task {
            do {
                let response = try await networkManager.execute(
                    request: SearchRequest.createRequest(text: "American airline"),
                    modelName: SearchReponse.self)
                self.results = response.results
                self.relatedTopics = response.relatedTopics
                networkManager.didUpdateSearchResults(results: self.results, relatedTopics: self.relatedTopics)
            } catch {
                networkManager.didFailWithError("Failed to fetch or parse data.")
            }
        }
    }
    
    func didUpdateSearchResults(results: [SearchResult], relatedTopics: [SearchResult]) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("User typed: \(searchText)")
    }
}
     
    
