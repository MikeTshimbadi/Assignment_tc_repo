//
//  ViewController.swift
//  CountryEmployeeDisplayApp
//
//  Created by Mike Tshimbadi on 4/29/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func LoginButtonPress(_ sender: Any) {
        if userNameTextField.text == "admin" && passwordTextField.text == "admin" {
            print("Login Successfull")
            performSegue(withIdentifier: "navigateToTabBar", sender: nil)
        } else {
            print("login failed")
        }
        
    }
    
}
