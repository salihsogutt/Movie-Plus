//
//  HomeProfileTableViewCell.swift
//  MoviePlus
//
//  Created by salih söğüt on 22.06.2024.
//

import UIKit
import FirebaseAuth
import Kingfisher

class HomeProfileTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profilePhoto: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    static let reuseId = "profileCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profilePhoto.layer.borderWidth = 1
        profilePhoto.layer.masksToBounds = false
        profilePhoto.layer.cornerRadius = profilePhoto.frame.size.height / 2
        profilePhoto.clipsToBounds = true
    }
    
    
    
}
