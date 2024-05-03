//
//  CartView.swift
//  corgi-shop
//
//  Created by Robin Schwenzfeier on 17.10.23.
//

import SwiftUI
import SwiftData

struct CartView: View {
    
    @Query private var cartModel: [CartModel]
    
    let imgHeight: CGFloat = 50
    let imgWidth: CGFloat = 50
    
    @Environment(\.modelContext) private var context
    
    
    var body: some View {
        NavigationStack{
                Background()
                    .overlay(){
                        List {
                            ForEach(cartModel){item in
                                
                                HStack{
                                    URLCorgiPreviewImage(urlString: item.imageUrl, imgHeight: imgHeight, imgWidth: imgWidth)
                                        .frame(maxWidth: imgWidth, maxHeight: imgHeight)
                                        .shadow(radius: 5)
                                        .padding(0)
                                    
                                    Text(item.name!)
                                    
                                    Spacer()
                                    
                                    Text("\(item.price! * item.amount!)€")
                                        .padding(.horizontal, 5)
                                }
                                    .swipeActions(edge: .leading) {
                                        Button {
                                            print("Adding")
                                            
                                            @State  var amount: Int = item.amount!
                                            
                                            if item.amount != nil {
                                                item.amount = item.amount! + 1
                                            }
                                            
                                            print(item.amount!)
                                            
                                            do {
                                                try context.save()
                                            } catch{
                                                print(error.localizedDescription)
                                            }
                                            
                                            
                                        } label: {
                                            Label("Add", systemImage: "plus.circle")
                                        }
                                        .tint(.yellow)
                                    }
                                    .swipeActions(edge: .trailing) {
                                        Button {
                                            print("Substracting")
                                            
                                            @State  var amount: Int = item.amount!
                                            
                                            if item.amount! <= 1 {
                                                context.delete(item)
                                            }
                                            
                                            else if item.amount != nil {
                                                item.amount = item.amount! - 1
                                                
                                                print(item.amount!)
                                            }
                                            
                                            do {
                                                try context.save()
                                            } catch{
                                                print(error.localizedDescription)
                                            }
                                            
                                            
                                        } label: {
                                            Label("Subtract", systemImage: "minus.circle")
                                        }
                                        .tint(.indigo)
                                        
                                        Button(role: .destructive) {
                                            print("Deleting Item")
                                            context.delete(item)
                                        } label: {
                                            Label("Delete", systemImage: "trash.fill")
                                        }
                                        
                                    }
                                    .badge(item.amount! > 1 ? item.amount! : 0)
                                    
                            }
                        }
                            
                            .listRowSpacing(16.0)
                            .scrollContentBackground(.hidden)
                        
                    }
                    .navigationTitle("Cart")
                    .background(.ultraThinMaterial)
        }
        
    }
}

#Preview {
    CartView()
        .modelContainer(for: [CartModel.self])
}
