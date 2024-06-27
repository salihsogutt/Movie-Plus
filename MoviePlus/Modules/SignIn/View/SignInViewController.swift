//
//  SignInViewController.swift
//  MoviePlus
//
//  Created by salih söğüt on 25.06.2024.
//

import UIKit
import FirebaseAuth
import FirebaseAnalytics

class SignInViewController: UIViewController {
    
    @IBOutlet weak var emailTf: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    
    var viewModel = SingInViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Analytics.logEvent("Screen Opened", parameters: ["Screen Name" : "SignIn Screen"])
        
        viewModel.delegate = self
        
    }
    static func show(from: UIViewController) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SingInViewController")
        from.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func onLogin(_ sender: Any) {
        viewModel.singInUser(email: emailTf.text, password: passwordTf.text)
    }
    

}


extension SignInViewController: SingInViewModelProtocol {
    func showHome() {
        TabBarViewController.show(from: self)
    }
    
    
    func showAlert(message: String) {
        self.alertMessage(titleInput: "ERROR", messageInput: message )
    }
}
