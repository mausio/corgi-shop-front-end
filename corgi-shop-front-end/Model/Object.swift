//
//  Object.swift
//  corgi-shop
//
//  Created by Robin Schwenzfeier on 18.10.23.
//

import Foundation

struct Corgi: Hashable, Codable {
    var id: Int?
    var name: String?
    var price: Int?
    var description: String?
    var imageUrl: String?
    
    var birthdate: String?
    var coatColor: String?
    var weight: Int?
    var height: Int?
    var male: Bool?
}

struct Item: Hashable, Codable{
    var id: Int?
    var name: String?
    var price: Int?
    var isFavorite: Bool?
    var description: String?
    var imageUrl: String?
}

struct Category: Hashable, Codable{
    var name: String?
    var imageUrl: String?
}
