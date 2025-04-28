//
//  ViewController.swift
//  ProductObjectDisplay
//
//  Created by Mike Tshimbadi on 4/24/25.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }

    @IBAction func LoginPressButton(_ sender: Any) {
        if userNameTextField.text == "admin" && passwwordTextField.text == "admin" {
            
            performSegue(withIdentifier: "navigateToHome", sender: nil)
            print("Login Succefull")
            
        } else {
            print("Login Failed")
        }
    }
    
}

