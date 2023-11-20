//
//  CategoryView.swift
//  corgi-shop
//
//  Created by Robin Schwenzfeier on 17.10.23.
//

import SwiftUI



struct MerchView: View {
    
    let categories: [Category] = [
        Category(name: "Kissen", imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQacf4n1UIVbzFSiIDYZHnTSqHBxuT0BZuL3zgOJ5sgwVFGjADsd49Eqe0WYUkDCQ04MA&usqp=CAU"),
        Category(name: "Pullover", imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRz84cPFPBSJ30VbGcFfwGYep3Xro8jAJMw1Nb88x9HtyId0kNwBzux4bYB_BtoKieyxPM&usqp=CAU"),
        Category(name: "Hüte", imageUrl: ""),
        Category(name: "Tasen", imageUrl: "")
    ]
    
    let items: [Item] = [
        Item(id: 1, name: "Item 1", price: 10, isFavorite: true, description: "This is item 1.", imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQacf4n1UIVbzFSiIDYZHnTSqHBxuT0BZuL3zgOJ5sgwVFGjADsd49Eqe0WYUkDCQ04MA&usqp=CAU"),
        Item(id: 2, name: "Item 2", price: 20, isFavorite: false, description: "This is item 2.", imageUrl: "data:image/jpeg;base64,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"),
        Item(id: 3, name: "Item 3", price: 15, isFavorite: true, description: "This is item 3.", imageUrl: "https://ih1.redbubble.net/image.408492528.7602/st,small,507x507-pad,600x600,f8f8f8.u4.jpg"),
        Item(id: 4, name: "Item 3", price: 15, isFavorite: true, description: "This is item 3.", imageUrl: "data:image/jpeg;base64,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"),
        Item(id: 5, name: "Item 3", price: 15, isFavorite: true, description: "This is item 3.", imageUrl: "https://ih1.redbubble.net/image.688525826.9199/st,small,507x507-pad,600x600,f8f8f8.u8.jpg"),
        Item(id: 6, name: "Item 3", price: 15, isFavorite: true, description: "This is item 3.", imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSopNyHW-4QR3WsPLkFSnnWC-_C7_PSz5URcA&usqp=CAU"),
        Item(id: 7, name: "Item 3", price: 15, isFavorite: true, description: "This is item 3.", imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNyQ4VshgpUiPaQA8vC2uKUEe_uK5yypDlQdG6olXbW5ZbN9V3owfETmVMtbzO9TVANws&usqp=CAU"),
        Item(id: 8, name: "Item 3", price: 15, isFavorite: true, description: "This is item 3.", imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5SeLw3PwYxvhWTXEEhK6XjhyZY8OsOjiJ4A&usqp=CAU"),
        Item(id: 9, name: "Item 3", price: 15, isFavorite: true, description: "This is item 3.", imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeHGOEc8xbBGDVLDiLKlhrjFGGpyy667J8ugPX9-VcMC16U80HGDRNr3yHiIIMS60CD3A&usqp=CAU"),
        Item(id: 10, name: "Item 3", price: 15, isFavorite: true, description: "This is item 3.", imageUrl: "https://image.spreadshirtmedia.net/image-server/v1/products/T813A2PA5870PT17X64Y79D132464332W14393H12593/views/1,width=500,height=500,appearanceId=2,backgroundColor=fff/topi-the-corgi-black-text-frauen-premium-t-shirt.jpg")
    ]
    
    
    var recWidth: CGFloat = 150
    var recHeight: CGFloat = 220
    
    
    var body: some View {
            NavigationStack{
                Background()
                    .overlay(){
                        ScrollView{
                            VStack(alignment: .leading){
                                Text("Categories")
                                    .font(.title2)
                                    .foregroundStyle(.white)
                                    .padding(.leading, 10)
                                    .padding(.top, 20)
                                    .fontWeight(.bold)
                                
                                ScrollView(.horizontal, showsIndicators: false){
                                    HStack(spacing: 10){
                                        ForEach(categories, id: \.self) {category in
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
                                
                                VStack(alignment: .leading){
                                    ForEach(categories, id: \.self){category in
                                        
                                        NavigationLink(){
                                            CategoryView(category: category)
                                        } label:{
                                            VStack(alignment: .leading){
                                            if let categoryName = category.name {
                                                Text(categoryName)
                                                    .font(.title2)
                                                    .foregroundStyle(.white)
                                                    .padding(.leading, 10)
                                                    .padding(.top, 20)
                                                    .fontWeight(.bold)
                                            }
                                            
                                            
                                                Grid(){
                                                    GridRow(){
                                                        ForEach(items[0...3], id: \.self) {item in
                                                            ItemCategoryPreview(urlString: item.imageUrl, recWidth: 50, recHeight: 50)
                                                                .shadow(radius: 10)
                                                        }
                                                    }
                                                    
                                                    
                                                    GridRow(){
                                                        ForEach(items[4...7], id: \.self) {item in
                                                            ItemCategoryPreview(urlString: item.imageUrl, recWidth: 50, recHeight: 50)
                                                                .shadow(radius: 10)
                                                        }
                                                    }
                                                }
                                            }.padding(.horizontal, 10)
                                        }
                                    }
                                }
                                
                                
                                Spacer()
                            }.navigationTitle("Merch")
                        }
                    }
            }
    }
    }

#Preview {
    MerchView()
}
