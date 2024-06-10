//
//  CategoryView.swift
//  corgi-shop
//
//  Created by Robin Schwenzfeier on 17.10.23.
//

import SwiftUI



struct MerchView: View {
    
    var recWidth: CGFloat = 150
    var recHeight: CGFloat = 220
    
    @StateObject var merchModel = MerchModel()
    
    func findMax(category: Category) -> Int{
      print("max item.count: \(category.items.count)")
        if(category.items.count < 4){
            return (category.items.count - 1)
        }else{
            return 3;
        }
        
    }
    
    
    var body: some View {
        
            NavigationStack{
                Background()
                    .overlay(){
                        ScrollView(){
                            VStack{
                                VStack(alignment: .leading){
                                    Text("Categories")
                                        .font(.title2)
                                        .padding(.leading, 20)
                                        
                                        .fontWeight(.bold)
                                    
                                    ScrollView(.horizontal, showsIndicators: false){
                                        
                                        HStack(spacing: 10){
                                            ForEach(merchModel.categories, id: \.self) {category in
                                                if (category.imageUrl != nil && category.name != nil) {
                                                    NavigationLink() {
                                                        CategoryView(category: category)
                                                    } label: {
                                                        CategoryRectPreview(category: category)
                                                    }
                                                }
                                            }.padding(.leading, 10)
                                        }.padding()
                                    }
                                }
                                
                                VStack(alignment: .leading){
                                    ForEach(merchModel.categories, id: \.self){category in
                                        
                                        NavigationLink(){
                                            CategoryView(category: category)
                                        } label:{
                                            VStack(alignment: .leading){
                                                if let categoryName = category.name {
                                                    Text(categoryName)
                                                        .font(.title2)
                                                        .foregroundStyle(Color.primary)
                                                        .fontWeight(.bold)
                                                }
                                                Grid(){
                                                    GridRow(){
                                                        ForEach(category.items[0...findMax(category: category)], id: \.self) {item in
                                                            ItemCategoryPreview(urlString: item.imageUrl, recWidth: 50, recHeight: 50)
                                                                .shadow(radius: 10)
                                                                .offset(x: 20)
                                                        }
                                                        
                                                        Image(systemName: "arrow.up.right.square.fill")
                                                            .resizable()
                                                            .frame(width: 60, height: 60)
                                                            .background(Color.white)
                                                            .cornerRadius(10)
                                                            .padding(20)
                                                            .aspectRatio(contentMode: .fill)
                                                            .foregroundStyle(Color.black)
                                                            .offset(x: -15, y: -38)
                                                            .shadow(radius: 3)
                                                        
                                                            
                                                        
                                                    }
                                                }
                                                .offset(x: 20)
                                            }.padding(.horizontal, 20)
                                                .padding(.top, 20)
                                                
                                               
                                        }
                                    }
                                    
                                }
                                
                                }.navigationTitle("Merch")
                                .padding(.top, 20)
                                .padding(.bottom, 40)
                                .background(.ultraThinMaterial)
                                
                            }
                        }
            }.onAppear(){
                merchModel.fetch()
            }
    }
}

#Preview {
    MerchView()
}
