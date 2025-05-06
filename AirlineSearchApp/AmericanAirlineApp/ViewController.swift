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
        
        let searchText = ""
        let query = searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let endpoint = "https://api.duckduckgo.com/?q=\(query)&format=json&pretty=1"
        
        networkManager.doApi(endPoint: endpoint, modelName: SearchReponse.self) { response, error in
            
            if let response = response {
                self.results = response.results
                self.relatedTopics = response.relatedTopics
                DispatchQueue.main.async {
//                    self.results = response.results // Assign the results to array
//                    self.relatedTopics = response.relatedTopics
                    self.tableView.reloadData()
                }
            } else if let error = error {
                print("API Error: \(error)")
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    
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
        
        //        if indexPath.section == 0 {
        //            let cell = UITableViewCell()
        //            searchBar.placeholder = "Search"
        //            return cell
        //        }
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
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("User typed: \(searchText)")
        // You can filter your section 1 and section 2 data here and reload the table
        
        let query = searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let endpoint = "https://api.duckduckgo.com/?q=\(query)&format=json&pretty=1"
        
        networkManager.doApi(endPoint: endpoint, modelName: SearchReponse.self) { response, error in
            if let response = response {
                DispatchQueue.main.async {
                    self.results = response.results
                    self.relatedTopics = response.relatedTopics
                    self.tableView.reloadData()
                }
            } else if let error = error {
                print("API Error: \(error)")
            }
        }
    }
    
}

//
//else {
//    
//    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//    cell.textLabel?.text = "\(indexPath.section)-\(indexPath.row)"
//    return cell
//}
