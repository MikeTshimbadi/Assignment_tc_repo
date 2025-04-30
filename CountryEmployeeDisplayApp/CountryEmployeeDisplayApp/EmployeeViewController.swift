//
//  EmployeeViewController.swift
//  CountryEmployeeDisplayApp
//
//  Created by Mike Tshimbadi on 4/29/25.
//

import UIKit

class EmployeeViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var employees: [[String: Any]] = [
        ["fName":"Stephen",
         "lName":"Curry",
         "EmployeeID": 30,
         "JobTitle":"Point Guard",
         "deskNumber": 1],
        ["fName":"Moses",
         "lName":"Moody",
         "EmployeeID": 3,
         "JobTitle":"Shooting Guard",
         "deskNumber": 2],
        ["fName":"Jonathan",
         "lName":"Kuminga",
         "EmployeeID": 00,
         "JobTitle":"Small foward",
         "deskNumber": 2],
        ["fName":"Draymond",
         "lName":"Green",
         "EmployeeID": 23,
         "JobTitle":"Power Forward ",
         "deskNumber": 4],
        ["fName":"Jimmy",
         "lName":"Butler",
         "EmployeeID": 10,
         "JobTitle":"Center",
         "deskNumber": 5],
        ["fName":"Steve",
         "lName":"Kerr",
         "EmployeeID": 11,
         "JobTitle":"Coach",
         "deskNumber": 0],
        ["fName":"Jerry",
         "lName":"Stackhouse",
         "EmployeeID": 14,
         "JobTitle":"Assistant Coach",
         "deskNumber": 6],
        ["fName":"Mike",
         "lName":"Danlievy",
         "EmployeeID": 25,
         "JobTitle":"General Manager",
         "deskNumber": 7],
        ["fName":"Dave",
         "lName":"William",
         "EmployeeID": 15,
         "JobTitle":"Equip manager",
         "deskNumber": 20],
        ["fName":"Joe",
         "lName":"Lacob",
         "EmployeeID": 50,
         "JobTitle":"Owner",
         "deskNumber": 100],]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                 for: indexPath) as? NameTableTableViewCell
        
        cell?.nameLabel.text = "\(employees[indexPath.row]["fName"] ?? "") \(employees[indexPath.row]["lName"] ?? "")"
        cell?.descriptionLabel.text = "\(employees[indexPath.row]["JobTitle"] ?? "")"
        
        return cell ?? UITableViewCell()
    }
    

}
