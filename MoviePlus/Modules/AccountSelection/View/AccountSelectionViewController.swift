//
//  AccountSelectionViewController.swift
//  MoviePlus
//
//  Created by salih söğüt on 20.06.2024.
//

import UIKit
import GoogleSignIn
import GoogleSignInSwift
import FirebaseAuth
import FirebaseCore
import FirebaseAnalytics

class AccountSelectionViewController: UIViewController, AccountSelectionViewModelProtocol {
    
    var viewModel = AccountSelectionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Analytics.logEvent("Screen Opened", parameters: ["Screen Name" : "AccountSelection Screen"])
        
        viewModel.delegate = self
    }
    @IBAction func GoogleSingInButton(_ sender: Any) {
        viewModel.googleSingIn(view: self)
    }
    
    @IBAction func onSingIn(_ sender: Any) {
        SignInViewController.show(from: self)
    }
    @IBAction func onRegister(_ sender: Any) {
        RegisterViewController.show(from: self)
    }
    
    func showAlert(message: String) {
        alertMessage(titleInput: "ERROR", messageInput: message)
    }
    
    func showHome() {
        TabBarViewController.show(from: self)
    }
}

