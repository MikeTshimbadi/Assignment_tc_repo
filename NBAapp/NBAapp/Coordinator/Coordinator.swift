//
//  Coordinator.swift
//  NBAapp
//
//  Created by Mike Tshimbadi on 6/11/25.
//

import Foundation
import UIKit
import SwiftUI

protocol CoordinatorProtocol: AnyObject {
    func start() -> UINavigationController
    func navigateToLogin()
    func navigateToSignUp()
//    func login()
}

final class Coordinator: CoordinatorProtocol {
   
    let navigationController = UINavigationController()
 
    func start() -> UINavigationController {
        let viewcontroller = ViewController()
        viewcontroller.coordinator = self // ✅ Set the coordinator
        navigationController.setViewControllers([viewcontroller], animated: true)
        return navigationController
    }

        
    func navigateToLogin() {
        let loginVC = LoginViewController()
        loginVC.view.backgroundColor = .white
        loginVC.title = "Login Page"
        loginVC.coordinator = self
        navigationController.pushViewController(loginVC, animated: true)
    }
    
    func navigateToSignUp() {
        let signUpVC = SignUpViewController()
        signUpVC.view.backgroundColor = .white
        signUpVC.title = "Sign Up Page"
        signUpVC.coordinator = self
        navigationController.pushViewController(signUpVC, animated: true)
    }
    
    func navigateToHomePage() {
        let homeView = HomePage(
            title: "Home Page",
            coordinator: self,
            onPlayerTap: { team in
                print("Tapped team: \(team.teamName)")
            }
        )
        
        let homeVC = UIHostingController(rootView: homeView)
        homeVC.view.backgroundColor = .white
        homeVC.title = "Home Page"
        navigationController.pushViewController(homeVC, animated: true)
    }

    
}
