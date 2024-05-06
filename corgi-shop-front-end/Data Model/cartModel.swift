//
//  cartModel.swift
//  corgi-shop-front-end
//
//  Created by Robin Schwenzfeier on 30.04.24.
//

import Foundation
import SwiftData

@Model
final class CartModel: Identifiable {
  var uuid: UUID?
    var id: Int?
    var name: String?
    var price: Int?
    var descrip: String?
    var imageUrl: String?
    
    var isCorgi: Bool
    var amount: Int?
    
  init(uuid: UUID?, id: Int?, name: String?, price: Int?, descrip: String?, imageUrl: String?, isCorgi: Bool, amount: Int?){
      self.uuid = uuid
        self.id = id
        self.name = name
        self.price = price
        self.descrip = descrip
        self.imageUrl = imageUrl
        self.isCorgi = isCorgi
        self.amount = amount
    }
}


