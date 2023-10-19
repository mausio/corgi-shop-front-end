//
//  URLImage.swift
//  corgi-shop-front-end
//
//  Created by Robin Schwenzfeier on 19.10.23.
//

import SwiftUI

struct URLImage: View {
    let urlString: String?
    
    @State var data: Data?
    
    var body: some View {
        
        if let data = data, let uiimage = UIImage(data: data){
            Image(uiImage: uiimage)
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: 130, height: 70)
                .background(Color.gray)
        }
        else{
            Image(systemName: "dog")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 130, height: 70)
                .padding(10)
                .onAppear(){
                    fetchSinglePhoto()
                }
        }
    }
    
    private func fetchSinglePhoto(){
        if let urlString = urlString, let url = URL(string: urlString) {
            let task = URLSession.shared.dataTask(with: url) { data, _, _ in
                self.data = data
            }
            task.resume()
        } else {
        }
    }
}
