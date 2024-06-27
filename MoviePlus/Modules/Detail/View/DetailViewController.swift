//
//  DetailViewController.swift
//  MoviePlus
//
//  Created by salih söğüt on 26.06.2024.
//

import UIKit
import SwiftUI
import FirebaseAnalytics

class DetailViewController: UIViewController {
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Analytics.logEvent("Screen Opened", parameters: ["Screen Name" : "Detail Screen"])
        
        let swiftUIView = DetailView(movie: movie)
        
        let hostingController = UIHostingController(rootView: swiftUIView)
        
        addChild(hostingController)
        view.addSubview(hostingController.view)
        
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        hostingController.didMove(toParent: self)
    }
    
    static func show(from: UIViewController, movie: Movie) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.movie = movie
        from.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}
