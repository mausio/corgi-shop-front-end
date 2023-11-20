//
//  CategoryRectPreview.swift
//  corgi-shop-front-end
//
//  Created by Robin Schwenzfeier on 18.11.23.
//

import SwiftUI

struct CategoryRectPreview: View {
    var category: Category
    
    let recWidth: CGFloat = 170
    let recHeight: CGFloat = 220
    
    
    var body: some View {
        Rectangle()
            .frame(width: recWidth, height: recHeight)
            .overlay(){
                ZStack{
                    LinearGradient(colors: [Color("accentColorFrom"), Color("accentColorTo")], startPoint: .bottomTrailing, endPoint: .top)
                    
                    MerchCategoryPreviewImage(urlString: category.imageUrl, recWidth: recWidth, recHeight: recHeight)
                        .foregroundStyle(Color("strongBlack"))
                        
                
                    VStack(alignment: .leading){
                        HStack{
                            if let name = category.name{
                                Text(name)
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .padding(.top, 20)
                                    .padding(.leading, 20)
                                    .padding(.trailing, 10)
                                    .padding(.bottom, 10)
                                    .foregroundStyle(Color("lightColor"))
                                    .background(Color("darkColor"))
                                    .cornerRadius(10)
                                    .offset(x: -10, y: -10)
                                
                                Spacer()
                            }
                        }
                        Spacer()
                    }
                }
            }
            .cornerRadius(10)
            .shadow(radius: 10)
            
    }
}

#Preview {
    var category = Category(name: "Kissen", imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQacf4n1UIVbzFSiIDYZHnTSqHBxuT0BZuL3zgOJ5sgwVFGjADsd49Eqe0WYUkDCQ04MA&usqp=CAU")
    
    return CategoryRectPreview(category: category)
}
