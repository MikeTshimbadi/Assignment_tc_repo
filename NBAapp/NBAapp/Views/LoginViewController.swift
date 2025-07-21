//
//  LoginViewController.swift
//  NBAapp
//
//  Created by Mike Tshimbadi on 6/11/25.
//

import UIKit

class LoginViewController: UIViewController, LoginActionDelegate {
    
    
    var coordinator: Coordinator?
    var loginActionView: LoginStackView?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        loginActionView?.delegate = self
        LoginLayoutUI()
    }

    func LoginLayoutUI() {
        let loginStackView = LoginStackView()
        self.loginActionView = loginStackView
        loginStackView.delegate = self
        loginStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginStackView)

        NSLayoutConstraint.activate([
            loginStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            loginStackView.heightAnchor.constraint(equalToConstant: 200)
        ])
    
    }
    
    func loginButtonTapped(username: String, password: String) -> Bool {
           // Handle login button tap
        if SignUpRepository.shared.validateUser(username: username, password: password) == true {
            return true
        } else {
            showAlert("Login Failed", "Invalid username or password")
        }
        return false
    }
    
    func showAlert(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    
    func navigateToHomePageView() {
        coordinator?.navigateToHomePage()
    }
}
