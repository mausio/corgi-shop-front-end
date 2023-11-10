//
//  CorgisView.swift
//  corgi-shop
//
//  Created by Robin Schwenzfeier on 17.10.23.
//

import SwiftUI

struct CorgisView: View {
    
    var body: some View {
        ZStack{
            Background()
            CorgiList()
        }
    }
}

#Preview {
    CorgisView()
}
