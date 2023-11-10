//
//  URLImage.swift
//  corgi-shop-front-end
//
//  Created by Robin Schwenzfeier on 19.10.23.
//

import SwiftUI

struct URLCorgiPreviewImage: View {
    let urlString: String?
    
    @State var data: Data?
    
    var body: some View {
        
        if let data = data, let uiimage = UIImage(data: data){
            Image(uiImage: uiimage)
                .resizable()
                .padding(5)
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: 170, height: 100)
                
        }
        else{
            Image(systemName: "dog")
                .resizable()
                .padding(40)
                .aspectRatio(contentMode: .fill)
                .frame(width: 170, height: 100)
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


struct URLCorgiDetailImage: View {
    let urlString: String?
    
    @State var data: Data?
    
    var body: some View {
        
        if let data = data, let uiimage = UIImage(data: data){
            Image(uiImage: uiimage)
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(maxWidth: .infinity)
                .cornerRadius(10)
//                .padding(60)
                .ignoresSafeArea()
                
        }
        else{
            Image(systemName: "dog")
                .resizable()
                .padding(50)
                
                .background(Color.gray)
                .opacity(0.7)
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity)
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
