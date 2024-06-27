//
//  AccountSelectionViewModel.swift
//  MoviePlus
//
//  Created by salih söğüt on 20.06.2024.
//

import Foundation
import GoogleSignIn
import GoogleSignInSwift
import FirebaseAuth
import FirebaseCore

protocol AccountSelectionViewModelProtocol :AnyObject{
    func showAlert(message: String)
    func showHome()
}

class AccountSelectionViewModel {
    
    weak var delegate: AccountSelectionViewModelProtocol?
    
    func googleSingIn(view: UIViewController){
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        GIDSignIn.sharedInstance.signIn(withPresenting: view) { [unowned self] result, error in
            guard error == nil else {
                self.delegate?.showAlert(message: error?.localizedDescription ?? "")
                return
            }
            
            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString
            else {
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: user.accessToken.tokenString)
            
            Auth.auth().signIn(with: credential) { result, error in
                guard error == nil else {
                    self.delegate?.showAlert(message: error?.localizedDescription ?? "")
                    return
                }
                User.instance.email = result?.user.email
                User.instance.phone = result?.user.phoneNumber
                User.instance.name = result?.user.displayName
                User.instance.profileUrl = result?.user.photoURL
                self.delegate?.showHome()
            }
        }
        
    }
    
    static func show(from: UIViewController) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AccountSelectionViewController")
        vc.modalPresentationStyle = .fullScreen
        from.navigationController?.popToRootViewController(animated: true)
    }
}

