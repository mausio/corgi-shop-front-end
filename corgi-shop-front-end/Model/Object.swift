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
    var favorite: Bool?
    var description: String?
    var imageUrl: String?
    
    var birthdate: Date?
    var coatColor: String?
    var weight: Int?
    var height: Int?
    var male: Bool?
}

struct Item {
    var id: Int
    var name: String
    var price: Int
    var isFavorite: Bool
    var description: String
    var imageUrl: String
}

struct ToDo: Decodable {
  let userId: Int
  let id: Int
  let title: String
  let completed: Bool
    
    
//    enum CodingKeys: String, CodingKey {
//      case isComplete = "completed"
//      case userId, id, title
//    }
    
    enum CodingKeys: String, CodingKey {
      case completed
      case userId
      case id
      case title
    }
}

struct Photo: Codable, Hashable{
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
}
