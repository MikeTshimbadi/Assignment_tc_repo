//
//  Coordinator.swift
//  CountryApiProg
//
//  Created by Mike Tshimbadi on 5/26/25.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    func start()-> UINavigationController
//    func navigatetoAddNotes(noteAction: NoteAction)
}

final class MainCoordinator: Coordinator {
    
    private let navigationController = UINavigationController()
    
    
    func start()-> UINavigationController {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        guard let controller = storyboard.instantiateViewController (withIdentifier: "CountryViewController") as? CountryViewController else {
//            fatalError("CountryViewController not found in Main.storyboard")
//        }
        let controller = CountryViewController()
        controller.coordinator = self
        navigationController.viewControllers = [controller]
        return navigationController
    }
    
//    func navigatetoAddNotes(noteAction: NoteAction) {
//        let vc = CreateNoteViewController()
//        vc.viewModel = CreateNoteViewModel(noteAction: noteAction)
//        navigationController.pushViewController(vc, animated: true)
//    }
}
