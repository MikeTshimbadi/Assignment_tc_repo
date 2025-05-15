//
//  AppCoordinator.swift
//  CountryApiCallsApp
//
//  Created by Mike Tshimbadi on 5/14/25.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    func start()-> UINavigationController
    func navigateToSearchDetails()
//    func navigateToProductDetails()
}

class AppCoordinator: Coordinator {
    private var navigationController = UINavigationController()
    func start() -> UINavigationController {
        let sb = UIStoryboard(name:"Main", bundle: nil)
        if let countryViewController = sb.instantiateViewController(withIdentifier: "CountryViewController") as? CountryViewController {
//            countryViewController = ServiceManager()
            countryViewController.coodinator = self
            navigationController.setViewControllers([countryViewController], animated: true)
        }
        return navigationController
    }
    
    func navigateToSearchDetails() {
        let sb = UIStoryboard(name:"Main", bundle: nil)
        if  let countryDetailsViewController = sb.instantiateViewController(withIdentifier: "CountryDetailsViewController") as?
                CountryDetailsViewController {
            countryDetailsViewController.coordinator = self
            navigationController.pushViewController(countryDetailsViewController, animated: true)
        }
    }
    
    
}
