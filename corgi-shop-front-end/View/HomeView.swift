//
//  HomeView.swift
//  corgi-shop
//
//  Created by Robin Schwenzfeier on 17.10.23.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    
    @State var helloStatement: String = "Hello, log in pls!"
    @State private var isModalPresented = false
    @State private var loggedIn = false
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                Background()
                ScrollView{
                    VStack{
                            HStack{
                                Text(helloStatement)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .toolbar{
                                        if !loggedIn {
                                            ToolbarItem(placement: .topBarTrailing) {
                                                Button("Log in"){isModalPresented.toggle()}
                                                    .foregroundColor(.white)
                                                .bold()}
                                        }
                                        }
    
                                
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
                        
                }
                    
            }
            .navigationTitle("Home")
        }
        .sheet(isPresented: $isModalPresented) {
            LoginView().modelContainer(for: [UserModel.self])
        }
    }
}



#Preview("Home View") {
    HomeView()
}
