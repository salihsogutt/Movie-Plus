//
//  SingInViewModel.swift
//  MoviePlus
//
//  Created by salih söğüt on 25.06.2024.
//

import Foundation
import Firebase

protocol SingInViewModelProtocol: AnyObject {
    func showAlert(message: String)
    func showHome()
}

class SingInViewModel {
    
    weak var delegate: SingInViewModelProtocol?
    
    func singInUser(email: String?, password: String?) {
        if let email, let password {
            Auth.auth().signIn(withEmail:  email, password: password) { data, error in
                
                if error != nil {
                    self.delegate?.showAlert(message: error?.localizedDescription ?? "")
                } else {
                    User.instance.email = data?.user.email
                    User.instance.phone = data?.user.phoneNumber
                    User.instance.name = data?.user.displayName
                    User.instance.profileUrl = data?.user.photoURL
                    self.delegate?.showHome()
                }
            }
        }
    }
}
