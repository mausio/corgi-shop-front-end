//
//  CorgiList.swift
//  corgi-shop
//
//  Created by Robin Schwenzfeier on 18.10.23.
//

import SwiftUI

struct CorgiList: View {
    @StateObject var corgiModel = CorgiModel()
    
    let tabItemSelected = Color("strongBlack")
    let backgroundImage = Image("background")
    let tabItemNotSelected = UIColor(named: "lightColor")
    let tabBarColor = UIColor(named: "darkColor")
    let tabBarUIColorBackground = UIColor(named: "lightColor")
    
    var body: some View {
            NavigationView{
                ZStack {
                    Background()

                List {
                    ForEach(corgiModel.corgis, id: \.self) { corgi in
                        NavigationLink{
                            CorgiDetail(corgi: corgi)
                        } label: {
                            HStack {
                                URLCorgiPreviewImage(urlString: corgi.imageUrl)
                                    .frame(width: 100, height: 80)
                                    .cornerRadius(5)
                            
                                if let corgiName = corgi.name {
                                    Text(corgiName)
                                }
                            }
                            .padding(.vertical, 20)
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Corgis")
                .onAppear {
                    corgiModel.fetch()
                    UITabBar.appearance().unselectedItemTintColor = tabItemNotSelected
                    UITabBar.appearance().backgroundColor = tabBarUIColorBackground
                }
            }
        }
    }
}

struct NavigationBackground: View {
    var body: some View {
        Color.clear
    }
}

#Preview {
    CorgiList()
}
