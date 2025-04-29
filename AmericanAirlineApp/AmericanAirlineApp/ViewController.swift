//
//  ViewController.swift
//  AmericanAirlineApp
//
//  Created by Mike Tshimbadi on 4/28/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
  
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // intance dependency
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                 for: indexPath) as? NameTableViewCell
        
        return cell ?? UITableViewCell()
    }


}

