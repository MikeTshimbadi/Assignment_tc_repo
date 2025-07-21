//
//  SignUpViewController.swift
//  NBAapp
//
//  Created by Mike Tshimbadi on 6/12/25.
//

import UIKit

class SignUpViewController: UIViewController {
    var coordinator: Coordinator?
    var viewModel = SignUpViewModel()
    
    let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.borderStyle = .roundedRect
        return textField
    }()
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        return textField
    }()
    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
//        button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    func setupUI() {
        usernameTextField.placeholder = "username"
        usernameTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        usernameTextField.borderStyle = .roundedRect
        emailTextField.placeholder = "Email"
        emailTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        emailTextField.borderStyle = .roundedRect
        passwordTextField.placeholder = "Password"
        passwordTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        signUpButton.backgroundColor = .systemBlue
        signUpButton.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)

        let stack = UIStackView(arrangedSubviews: [usernameTextField, emailTextField, passwordTextField, signUpButton])
        stack.axis = .vertical
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stack)

        NSLayoutConstraint.activate([
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    @objc func signUpTapped() {
        guard let username = usernameTextField.text, let email = emailTextField.text, let password = passwordTextField.text else { return }
        if viewModel.signUp(username: username, password: password, email: email) {
            navigationController?.popViewController(animated: true)
        } else {
            showAlert("Unvalid input", "Try again")
        }
        
    }
    
    func showAlert(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

