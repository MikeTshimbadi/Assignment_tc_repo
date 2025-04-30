//
//  CountryViewController.swift
//  CountryEmployeeDisplayApp
//
//  Created by Mike Tshimbadi on 4/29/25.
//

import UIKit

class CountryViewController: UIViewController, UITableViewDelegate {
 
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        readUserJson()
    }
    
    var countries: [Country] = []
    
    func readUserJson() {
        // to read the file path userData
        guard let url = Bundle.main.url(forResource: "CountryData", withExtension: "json") else {
            return
        }
        // read the content of the url in the var called data
        guard let data = try? Data(contentsOf: url) else {
            return
        }
    
        _ = JSONDecoder()
        
        do {
            self.countries = try JSONDecoder().decode([Country].self, from: data)
        } catch {
            print("error decoding json")
        }
        
    }
}

extension CountryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                 for: indexPath) as? CountryNameTableViewCell
        
        cell?.CountryNameLabel.text = countries[indexPath.row].name
        cell?.CapitalLabel.text = countries[indexPath.row].capital
        cell?.CodeLabel.text = countries[indexPath.row].code
        
        return cell ?? UITableViewCell()
    }
    
}
