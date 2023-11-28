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
                    VStack{
                            HStack{
                                Text("Hallo, User!")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                
                                Spacer()
                                
                                Image(systemName: "person")
                                    .padding(10)
                                    .foregroundColor(.white)
                                    .background(Color("lightColor"))
                                    .cornerRadius(.infinity)
                                    .shadow(radius: 5)
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 8)
                        .background(.ultraThinMaterial)
                    }
                        
                }.navigationTitle("Home")
            }
        }
    }
}



#Preview("Home View") {
    HomeView()
}
