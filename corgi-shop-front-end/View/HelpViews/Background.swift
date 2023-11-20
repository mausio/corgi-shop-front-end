//
//  Background.swift
//  corgi-shop
//
//  Created by Robin Schwenzfeier on 18.10.23.
//

import SwiftUI

struct Background: View {
    var body: some View {
        Image("background")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(minWidth: 0, maxWidth: .infinity)
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    Background()
}
