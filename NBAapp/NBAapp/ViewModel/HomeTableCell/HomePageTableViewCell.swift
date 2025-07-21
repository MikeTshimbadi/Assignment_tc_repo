//
//  HomePageTableViewCell.swift
//  NBAapp
//
//  Created by Mike Tshimbadi on 6/5/25.
//

import UIKit

protocol HomeActionViewDelegate: AnyObject {
    func didTapLogin()
    func didTapSignUp()
}

class HomeActionView: UIView {
    weak var coordinator: CoordinatorProtocol?

    weak var delegate: HomeActionViewDelegate?
    //weak var coordinator: CoordinatorProtocol?
    let navigationController = UINavigationController()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        return button
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupActions()
    }
    
    

    private func setupView() {
        let buttonStack = UIStackView(arrangedSubviews: [loginButton, signUpButton])
        buttonStack.axis = .horizontal
        buttonStack.spacing = 20
        buttonStack.distribution = .fillEqually
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(buttonStack)
        
        NSLayoutConstraint.activate([
            buttonStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            buttonStack.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            loginButton.heightAnchor.constraint(equalToConstant: 44),
            signUpButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func setupActions() {
        loginButton.addTarget(self, action: #selector(handleLoginTap), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(handleSignUpTap), for: .touchUpInside)
    }
    
    
    @objc private func handleLoginTap() {
        print("Login button tapped")
        delegate?.didTapLogin()
        
    }

    @objc private func handleSignUpTap() {
        delegate?.didTapSignUp()
    }
}
