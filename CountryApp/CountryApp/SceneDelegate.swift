//
//  SceneDelegate.swift
//  CountryApp
//
//  Created by Mike Tshimbadi on 7/2/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scenewindow = (scene as? UIWindowScene) else { return }
        let controller = CountryViewController()
        window = UIWindow(windowScene: scenewindow)
        window?.rootViewController = UINavigationController(rootViewController: controller)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
    }

}

