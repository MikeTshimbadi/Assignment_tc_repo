//
//  SignUpModel.swift
//  NBAapp
//
//  Created by Mike Tshimbadi on 6/16/25.
//

import Foundation

class SignUpViewModel {
    func signUp(username:String, password:String, email:String) -> Bool {
        return SignUpRepository.shared.saveUser(username: username, password: password, email: email)
    }
}
