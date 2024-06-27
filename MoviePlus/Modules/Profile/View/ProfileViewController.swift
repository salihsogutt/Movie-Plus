//
//  ProfileViewController.swift
//  MoviePlus
//
//  Created by salih söğüt on 26.06.2024.
//

import UIKit
import Firebase
import FirebaseAnalytics

class ProfileViewController: UIViewController {

    @IBOutlet weak var logout: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Analytics.logEvent("Screen Opened", parameters: ["Screen Name" : "Profile Screen"])
    }
    
    
    @IBAction func logoutButton(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            User.instance = User()
            AccountSelectionViewModel.show(from: self)
        } catch {
            
        }
    }
    
}
