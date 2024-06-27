//
//  User.swift
//  MoviePlus
//
//  Created by salih söğüt on 26.06.2024.
//

import Foundation

struct User {
    
    static var instance = User()
  
    var name: String?
    var email: String?
    var phone: String?
    var profileUrl: URL?
}

