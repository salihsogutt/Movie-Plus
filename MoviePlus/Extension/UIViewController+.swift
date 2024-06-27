//
//  UIViewController+.swift
//  MoviePlus
//
//  Created by salih söğüt on 26.06.2024.
//

import Foundation
import UIKit

extension UIViewController{
    func alertMessage(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
}
