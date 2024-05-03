//
//  cartHelpers.swift
//  corgi-shop-front-end
//
//  Created by Robin Schwenzfeier on 01.05.24.
//

import Foundation

func constructCartItemFromCorgi (corgi: Corgi) -> Item {
    return Item(id: corgi.id, name: corgi.name, price: corgi.price, imageUrl: corgi.imageUrl)
}
