//
//  LoginStackView.swift
//  NBAapp
//
//  Created by Mike Tshimbadi on 6/12/25.
//

import Foundation
import UIKit

protocol LoginActionDelegate: AnyObject {
    func loginButtonTapped(username: String, password: String) -> Bool
//    func validateLogin(username: String, password: String) -> Bool
    func navigateToHomePageView()
}

class LoginStackView: UIView {
    
    weak var delegate: LoginActionDelegate?
    
    let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Password"
        textfield.borderStyle = .roundedRect
        textfield.isSecureTextEntry = true
        return textfield
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        addTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        let stackView = UIStackView(arrangedSubviews: [usernameTextField, passwordTextField, loginButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        // Constraints for stackView
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            stackView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func addTarget() {
        loginButton.addTarget(self, action: #selector(handleLoginTap), for: .touchUpInside)
    }
    
    @objc private func handleLoginTap() {
        guard let username = usernameTextField.text,
              let password = passwordTextField.text else { return }
        if delegate?.loginButtonTapped(username: username, password: password) == true {
            delegate?.navigateToHomePageView()
        } 
    }

}
