//
//  userModel.swift
//  corgi-shop-front-end
//
//  Created by Robin Schwenzfeier on 01.05.24.
//

import Foundation

import SwiftData

@Model
final class UserModel {
    var mail: String
    var password: String
    
    
    init(mail: String, password: String){
        self.mail = mail;
        self.password = password
    }
}
