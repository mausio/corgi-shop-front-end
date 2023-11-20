//
//  CartView.swift
//  corgi-shop
//
//  Created by Robin Schwenzfeier on 17.10.23.
//

import SwiftUI

struct CartView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Background()
                ScrollView{
                    Text("Hello Cart!")
                }.navigationTitle("Cart")
            }
        }
    }
}

#Preview {
    CartView()
}
