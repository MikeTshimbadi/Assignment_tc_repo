//
//  EmployeeDetailViewController.swift
//  CountryEmployeeDisplayApp
//
//  Created by Mike Tshimbadi on 5/2/25.
//

import UIKit

class EmployeeDetailViewController: UIViewController {

    @IBOutlet weak var imageViewLbl: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = name
        // Do any additional setup after loading the view.
    }
    

}
