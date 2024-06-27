//
//  TabBarViewController.swift
//  MoviePlus
//
//  Created by salih söğüt on 26.06.2024.
//

import UIKit
import FirebaseAnalytics

class TabBarViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var viewForTab: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Analytics.logEvent("Screen Opened", parameters: ["Screen Name" : "TabBar Screen"])
        
        moveHome()
        designableTabBar()
    }
    
    func designableTabBar() {
        viewForTab.layer.cornerRadius = viewForTab.frame.size.height / 2
        viewForTab.clipsToBounds = true
    }
    
    func moveHome() {
        guard let home = self.storyboard?.instantiateViewController(identifier: "HomeViewController") else { return }
        addChild(home)
        contentView.addSubview(home.view)
        home.didMove(toParent: self)
    }
    
    func moveProfile() {
        guard let profile = self.storyboard?.instantiateViewController(identifier: "ProfileViewController") else { return }
        addChild(profile)
        contentView.addSubview(profile.view)
        profile.didMove(toParent: self)
    }
    
    func moveSecond() {
        guard let second = self.storyboard?.instantiateViewController(identifier: "SecondViewController") 
            else { return }
        contentView.addSubview(second.view)
        second.didMove(toParent: self)
    }
    
    func moveThird() {
        guard let third = self.storyboard?.instantiateViewController(identifier: "ThirdViewController")
            else { return }
        contentView.addSubview(third.view)
        third.didMove(toParent: self)
    }
        
    @IBAction func onClickTabBar(_ sender: UIButton) {
        let tag = sender.tag
        if tag == 1 {
            moveHome()
        } else if tag == 2{
            moveSecond()
        } else if tag == 3{
            moveThird()
        } else {
            moveProfile()
        }
    }
    static func show(from: UIViewController) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarViewController")
        from.navigationController?.pushViewController(vc, animated: true)
    }
}
