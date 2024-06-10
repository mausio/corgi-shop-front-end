//
//  HomeView.swift
//  corgi-shop
//
//  Created by Robin Schwenzfeier on 17.10.23.
//

import SwiftUI
import SwiftData

struct HomeView: View {
  
  @Environment(\.modelContext) private var context
  
  @Query private var users: [UserModel]
  
  
  @State private var firstUser: UserModel?
  @State private var loggedIn: Bool = false
    @State var helloStatement: String = "Hello, log in pls!"
    @State private var isModalPresented = false
  
  
  private func fetchUser() {
      if let user = users.first {
          firstUser = user
          loggedIn = true
          helloStatement = "Hello, \(user.mail)!"
      } else {
          firstUser = nil
          loggedIn = false
          helloStatement = "Hello, log in pls!"
      }
    
  }
    
    
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
                                
                                Button() {
                                  if !loggedIn {
                                    isModalPresented.toggle()
                                  }
                                }
                            label:{
                                    
                                    Image(systemName: "person")
                                        .padding(10)
                                        .foregroundColor(.white)
                                        .background(Color("lightColor"))
                                        .cornerRadius(.infinity)
                                        .shadow(radius: 5)
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 8)
                        .background(.ultraThinMaterial)
                    }
                        
                }
                    
            }
            .navigationTitle("Home")
        }
        .sheet(isPresented: $isModalPresented, onDismiss: fetchUser) {
            LoginView().modelContainer(for: [UserModel.self])
        }
        .onAppear(){

        }
    }
}



#Preview("Home View") {
    HomeView()
}
