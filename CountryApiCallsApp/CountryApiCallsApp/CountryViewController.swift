//
//  ViewController.swift
//  CountryApiCallsApp
//
//  Created by Mike Tshimbadi on 5/1/25.
//

import UIKit

class CountryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
//        tableView.delegate = self
        getUsers()
        
    }
    
    var countries: [Country] = []

func getUsers() {
    guard let url = URL(string: "https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json") else {
        return
    }
    
    let session  = URLSession.shared
    // this is a closure which runs in the background thread
    let datatask = session.dataTask(with: url) {
        data, response, error in
        guard let data = data else { return }
        
        let jsonDecoder = JSONDecoder()
        do {
            self.countries = try jsonDecoder.decode([Country].self, from: data)
            print(self.countries)
            // switchign back to the main thread
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
//                print(employees)
        } catch {
            
        }
    }
    datatask.resume()
}
}

extension CountryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell",
                                                 for: indexPath) as? CountryTableViewCell
        
        cell?.nameLabel.text = countries[indexPath.row].name
        cell?.capitalLabel.text = countries[indexPath.row].capital
        cell?.codeLabel.text = countries[indexPath.row].code
        
        return cell ?? UITableViewCell()
    }


}

