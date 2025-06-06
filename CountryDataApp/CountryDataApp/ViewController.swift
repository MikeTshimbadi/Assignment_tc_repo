//
//  ViewController.swift
//  CountryDataApp
//
//  Created by Mike Tshimbadi on 4/26/25.
//

import UIKit


// when confirmng to a protocol, it is better to do it in the extension when there's more than one or enum
class ViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // instance dependency
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
        
        //        print("data=====>\(data)")
        
        //        let jsonDecoder = JSONDecoder()
        _ = JSONDecoder()
        
        do {
            self.countries = try JSONDecoder().decode([Country].self, from: data)
        } catch {
            print("error decoding json")
        }
        
        //        DispatchQueue.main.async {
        //                   self.tableView.reloadData()
        //               }
    }
}


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                 for: indexPath) as? NameTableViewCell
        
        cell?.CountryName.text = countries[indexPath.row].name
        cell?.CountryCapitalView.text = countries[indexPath.row].capital
        cell?.CountryCodeView.text = countries[indexPath.row].code
        
        return cell ?? UITableViewCell()
    }
    
}

//
//extension ViewController: UITableViewDelegate{
//    func tabliew (_ tableView: UITableView, numberOfRowsInSection section: Int ) -> Int {
//        
//    }
//}



