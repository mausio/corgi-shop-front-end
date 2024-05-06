//
//  ItemView.swift
//  corgi-shop-front-end
//
//  Created by Robin Schwenzfeier on 29.11.23.
//

import SwiftUI
import SwiftData

struct ItemView: View {
    var item: Item
    
    @Query private var cartModel: [CartModel]
    
    let darkColor = Color("darkColor")
    let lightColor = Color("lightColor")
    let accentColorTo = Color("accentColorTo")
    
    @Environment(\.modelContext) private var context
    
    var body: some View {
        ScrollView{
            ZStack{
                if let itemImageUrl = item.imageUrl {
                    URLitemDetailImage(urlString: itemImageUrl)
                }
                
            }.ignoresSafeArea()
            
            
                
            VStack(alignment: .leading){
                VStack(alignment: .leading){
                    HStack(spacing: 20){
                        if let itemName = item.name {
                            Text(itemName)
                                .font(.title)
                                .fontWeight(.bold)
                        } else{
                            Text("Cute item Name")
                        }
                        
                        Spacer()
                        
                        Button{
                            
                            let existingItem = cartModel.first { $0.uuid == item.uuid }
                          

                            if existingItem != nil {
                              existingItem!.amount = existingItem!.amount! + 1
                            } 
                            else {
                              let newItem = CartModel(uuid: UUID.init(), id: item.id, name: item.name, price: item.price, descrip: item.description, imageUrl: item.imageUrl, isCorgi: false, amount: 1)
                              context.insert(newItem)
                            }
                            
                        } label: {
                            Image(systemName: "cart")
                                .fontWeight(.bold)
                                .padding()
                                .foregroundColor(darkColor)
                                .background(lightColor)
                                .cornerRadius(10)
                        }
                            
                    
                        Image(systemName: "star")
                            .fontWeight(.bold)
                            .foregroundColor(accentColorTo)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(accentColorTo, lineWidth: 3)
                            )
                            
                    
                    }
                }
                Spacer()
                
                    Grid {
                        GridRow {
                            if let itemPrice = item.price {
                                    Text("Price: ")
                                    .fontWeight(.bold)
                                    
                                Text("\(itemPrice)€")
                                    .fontWeight(.bold)
                            }
                        }
                        .gridColumnAlignment(.leading)
                        

                    }
                    
                
                
                Spacer()
                Divider()
                Spacer(minLength: 25)
                    
                if let itemDescription = item.description {
                    Text(itemDescription)
                }else{
                    Text("item Description")
                }
                }
                .padding(.top, 25)
                .padding(.horizontal, 25)
                .padding(.bottom, 200)
                .background()
                .cornerRadius(20)
                .offset(y: -50)
 
        }
        .ignoresSafeArea()
        
    }
}

#Preview {
  ItemView(item: Item(uuid: UUID.init(), id: 999, name: "Shirt", price: 123, isFavorite: false, description: "stuff", imageUrl: "https://m.media-amazon.com/images/I/61ZWOW1WNJL._AC_UY580_.jpg" ))
        .modelContainer(for: [CartModel.self])
}
