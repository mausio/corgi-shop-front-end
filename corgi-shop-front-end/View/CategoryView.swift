//
//  CategoryView.swift
//  corgi-shop-front-end
//
//  Created by Robin Schwenzfeier on 20.11.23.
//

import SwiftUI

struct CategoryView: View {
    var category: Category
    
    let columns = [
        GridItem(),
        GridItem(),
    ]
    
    var body: some View {
        if let name = category.name{
            NavigationStack{
                Background()
                    .overlay(){
                        ScrollView{
                            VStack() {
                                LazyVGrid(columns: columns, alignment: .center, spacing: 30) {
                                    ForEach(category.items, id: \.self) { item in
                                        NavigationLink{
                                            ItemView(item: item).modelContainer(for: [CartModel.self])
                                        } label: {
                                            ItemRectPreview(item: item)
                                                .shadow(radius: 10)
                                        }
                                    }
                                }
                                .padding(.horizontal, 25)
                            }
                            .padding(.vertical, 50)
                            .background(.ultraThinMaterial)
                        }
                    }
            }
            .navigationTitle(name)
        }
    }
}

#Preview {
    CategoryView(category: Category(items: []))
}
