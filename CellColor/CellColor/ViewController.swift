//
//  ViewController.swift
//  CellColor
//
//  Created by Mike Tshimbadi on 4/24/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func loginButtonAction(_ sender: Any) {
        if usernameTextField.text == "admin" && passwordTextField.text == "admin" {
            
            performSegue(withIdentifier: "navigateToHome", sender: nil)
            print("Login Successfull")
        } else {
        print("login failed")
       }
    }
    
}

