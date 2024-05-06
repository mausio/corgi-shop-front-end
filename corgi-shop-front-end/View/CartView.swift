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
    
    func cartItemsCount() -> Int{
        var counter = 0;
        for item in cartModel{
            counter += item.amount!;
        }
        return counter
    }
    
    func getTotalAmount() -> Double{
        var price = 0.0;
        for item in cartModel{
            price += Double(item.amount! * item.price!);
        }
        return price
    }
    
    
    var body: some View {
        NavigationStack{
                Background()
                    .overlay(){
                        VStack{
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
                                      if(!item.isCorgi){
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
                                    }
                                    .swipeActions(edge: .trailing) {
                                      if(!item.isCorgi && item.amount! > 1){
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
                                      }
                                        
                                        Button(role: .destructive) {
                                            print("Deleting Item")
                                            context.delete(item)
                                          
                                          do {
                                            try context.save()
                                          } catch{
                                            print(error.localizedDescription)
                                          }
                                        } label: {
                                            Label("Delete", systemImage: "trash.fill")
                                        }
                                        
                                    }
                                    .badge(item.amount! > 1 ? item.amount! : 0)
                                    
                                }
                            }
                            
                            .listRowSpacing(16.0)
                            .scrollContentBackground(.hidden)
                            
                            
                            HStack{
                                
                                if(cartItemsCount() < 1){
                                    Text("No Items in Cart")
                                        .padding()
                                } else                                 if(cartItemsCount() == 1){
                                    Text("\(cartModel.count) Item")
                                        .bold()
                                    
                                    
                                    Divider()
                                        .frame(height: 20)
                                        .padding()
                                    
                                    Text("Total amount: \(String(format: "%.2f", getTotalAmount()))€")
                                        .bold()
                                }
                                else{
                                    Text("\(cartItemsCount()) Items")
                                        .bold()
                                    
                                    
                                    Divider()
                                        .frame(height: 20)
                                        .padding()
                                        
                                    Text("Total amount: \(String(format: "%.2f", getTotalAmount()))€")
                                        .bold()
                                }
                                
                            
                            }
                            .frame(maxWidth: .infinity)
                            .background()
                            .cornerRadius(10)
                            .padding()
                            
                        }
                        
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
