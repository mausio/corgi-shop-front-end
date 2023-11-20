//
//  CategoryView.swift
//  corgi-shop-front-end
//
//  Created by Robin Schwenzfeier on 20.11.23.
//

import SwiftUI

struct CategoryView: View {
    var category: Category
    
    var body: some View {
        ZStack{
            Background()
            
            if let categoryName = category.name{
                Text("This is the category \"" + categoryName + "\"")
                    .font(.title)
                
                    
            }
        }
    }
}

#Preview {
    CategoryView(category: Category(name: "Kissen", imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQacf4n1UIVbzFSiIDYZHnTSqHBxuT0BZuL3zgOJ5sgwVFGjADsd49Eqe0WYUkDCQ04MA&usqp=CAU"))
}
