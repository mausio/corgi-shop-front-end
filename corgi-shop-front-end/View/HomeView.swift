//
//  HomeView.swift
//  corgi-shop
//
//  Created by Robin Schwenzfeier on 17.10.23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Background()
                ScrollView{
                    Text("Home, Sweet Home")
                }.navigationTitle("Home")
            }
        }
    }
}



#Preview("Home View") {
    HomeView()
}
