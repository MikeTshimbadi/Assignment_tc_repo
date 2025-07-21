//
//  SignUpRepository.swift
//  NBAapp
//
//  Created by Mike Tshimbadi on 6/16/25.
//

import CoreData
import UIKit

class SignUpRepository {
    static let shared = SignUpRepository()
    private init() {}
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveUser(username:String, password:String, email:String) -> Bool {
        let user = User(context: context)
        user.username = username
        user.password = password
        user.email = email
        
        do {
            try context.save()
            return true
        } catch {
            return true
        }
    }
    
    func validateUser(username:String, password:String) -> Bool {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "username == %@ AND password == %@", username, password)
        
        do {
            let user = try context.fetch(fetchRequest)
            return user.count > 0
        } catch {
            return false
        }
    }
}
