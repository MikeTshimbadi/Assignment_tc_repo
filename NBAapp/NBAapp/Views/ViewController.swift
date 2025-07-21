//
//  ViewController.swift
//  NBAapp
//
//  Created by Mike Tshimbadi on 6/4/25.
//

import UIKit

class ViewController: UIViewController, HomeActionViewDelegate {
    
    weak var coordinator: CoordinatorProtocol?
    private let actionView = HomeActionView()
//    private let LoginButton = UIButton()
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "🏀 Welcome to My Hoops"
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .systemBackground
        actionView.delegate = self
        layoutUI()
        setupBackground()
        
    }
    private func setupBackground() {
        let backgroundImageView = UIImageView(image: UIImage(named: "the-basketball-is-in-an-enclosed-splash-and-being-sprayed-with-water-in-the-background-photo")) // Make sure the image is in your asset catalog
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    private func layoutUI() {
        actionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(welcomeLabel)
        view.addSubview(actionView)
        
        NSLayoutConstraint.activate([
            // Welcome label above the buttons
            welcomeLabel.bottomAnchor.constraint(equalTo: actionView.topAnchor, constant: -20),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            // Action view remains centered
            actionView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            actionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            actionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            actionView.heightAnchor.constraint(equalToConstant: 100) // Optional, for layout stability
        ])

    }
    
    func didTapLogin() {
        coordinator?.navigateToLogin()
    }
    
    
    func didTapSignUp() {
        coordinator?.navigateToSignUp()
    }
}
