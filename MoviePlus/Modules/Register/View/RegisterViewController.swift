//
//  RegisterViewController.swift
//  MoviePlus
//
//  Created by salih söğüt on 25.06.2024.
//

import UIKit
import FirebaseAuth
import FirebaseAnalytics

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTf: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    
    var viewModel = RegisterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Analytics.logEvent("Screen Opened", parameters: ["Screen Name" : "Register Screen"])
        
        viewModel.delegate = self
    }
    @IBAction func registerButton(_ sender: Any) {
        viewModel.registerUser(email: emailTf.text, password: passwordTf.text)
    }

    static func show(from: UIViewController) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegisterViewController")
        from.navigationController?.pushViewController(vc, animated: true)
    }
}

extension RegisterViewController: RegisterViewModelProtocol {
    func showHome() {
        TabBarViewController.show(from: self)        
    }
    
    func showAlert(message: String) {
        self.alertMessage(titleInput: "ERROR", messageInput: message )
    }
}
