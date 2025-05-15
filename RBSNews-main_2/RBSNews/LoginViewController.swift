//
//  ViewController.swift
//  RBSNews
//
//  RBS Tests Project on 12/10/20.
//

import UIKit
enum CustomError: Error {
     case divideByZero
}

class LoginViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    
    let expectedUsername = "rbs"
    let expectedPassword = "1234"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login screen"
    }
    
    

    @IBAction func loginButtonTapped(_ sender: UIButton) {
//        guard let username = usernameTextField.text, !username.isEmpty, let password = passwordTextField.text, !password.isEmpty else {
//            Utility.shared.showAlert(self, "Alert!", "Please input credentials.")
//            return
//        }
//        
//        guard expectedUsername == username else {
//            Utility.shared.showAlert(self, "Alert!", "Username is invalid")
//            return
//        }
//        
//        guard expectedPassword == password else {
//            Utility.shared.showAlert(self, "Alert!", "Password is invalid")
//            return
//        }
//        navigateToHomeScreen()
//        return
        
        let username = usernameTextField.text, !username.isEmpty, let password = passwordTextField.text, !password.isEmpty else {
            Utility.shared.showAlert(self, "Alert!", "Please input credentials.")
        
    }

    func validate(name: String?, pass: String?) -> String {
        guard let username = name, !username.isEmpty,
                  let password = pass, !password.isEmpty else {
                return "Please input credentials."
            }
            guard expectedUsername == username else {
                return "Username is invalid"
            }
            guard expectedPassword == password else {
                return  "Password is invalid"
            }

            return ""
    }
    
   
    
    func navigateToHomeScreen() {
        if let newsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "NewsViewController") as? NewsViewController {
            if let navigation = navigationController {
                navigation.pushViewController(newsViewController, animated: true)
            }
        }
    }
    
    func divide(dividend: Int, divisor: Int) throws -> Int {
        if divisor == 0 {
          throw CustomError.divideByZero
        } else {
            return dividend / divisor
        }
   }
    
}

