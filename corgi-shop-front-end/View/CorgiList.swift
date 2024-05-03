//
//  CorgiList.swift
//  corgi-shop
//
//  Created by Robin Schwenzfeier on 18.10.23.
//

import SwiftUI
import SwiftData

struct CorgiList: View {
    @StateObject var corgiModel = CorgiModel()
    
    let tabItemSelected = Color("strongBlack")
    let backgroundImage = Image("background")
    let tabItemNotSelected = UIColor(named: "lightColor")
    let tabBarColor = UIColor(named: "darkColor")
    let tabBarUIColorBackground = UIColor(named: "lightColor")
    
    let imgHeight: CGFloat = 100
    let imgWidth: CGFloat = 120
    
    var body: some View {
            NavigationStack{
                ZStack {
                    Background()

                List {
                    ForEach(corgiModel.corgis, id: \.self) { corgi in
                        NavigationLink{
                            CorgiDetail(corgi: corgi).modelContainer(for: [CartModel.self])
                        } label: {
                            HStack {
                                URLCorgiPreviewImage(urlString: corgi.imageUrl, imgHeight: imgHeight, imgWidth: imgWidth)
                                    .frame(maxWidth: imgWidth, maxHeight: imgHeight)
                                    .shadow(radius: 5)
                                    .padding(0)
                                
                            
                                if let corgiName = corgi.name {
                                    Text(corgiName)
                                }
                            }
                            .padding(.vertical, 10)
                        }
                    }
                }
                .scrollContentBackground(.hidden)
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
