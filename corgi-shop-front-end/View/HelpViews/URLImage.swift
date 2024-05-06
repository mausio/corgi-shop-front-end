//
//  URLImage.swift
//  corgi-shop-front-end
//
//  Created by Robin Schwenzfeier on 19.10.23.
//

import SwiftUI

struct URLCorgiPreviewImage: View {
    let urlString: String?
    
    var imgHeight: CGFloat
    var imgWidth: CGFloat
    
    @State var data: Data?
    
    var body: some View {
        
        if let data = data, let uiimage = UIImage(data: data){
            Image(uiImage: uiimage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: imgWidth, height: imgHeight)
                .cornerRadius(10)
                .padding(0)
                
                
        }
        else{
            Image(systemName: "dog")
                .resizable()
                
                .aspectRatio( contentMode: .fit)
                .frame(width: imgWidth, height: imgHeight)
                .cornerRadius(10)
                .onAppear(){
                    fetchSinglePhoto()
                }
                .padding(0)
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


struct MerchCategoryPreviewImage: View {
    let urlString: String?
    let recWidth: CGFloat?
    let recHeight: CGFloat?
    
    @State var data: Data?
    
    
    var body: some View {
        
        if let data = data, let uiimage = UIImage(data: data){
            Image(uiImage: uiimage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: recWidth, height: recHeight)
                
                
                
                
        }
        else{
            Image(systemName: "hanger")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(25)
                .frame(width: recWidth, height: recHeight)
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

struct ItemCategoryPreview: View {
    let urlString: String?
    let recWidth: CGFloat?
    let recHeight: CGFloat?
    
    @State var data: Data?
    
    var body: some View {
        if let data = data, let uiimage = UIImage(data: data){
            Image(uiImage: uiimage)
                .resizable()
                .aspectRatio(CGSize(width: 1, height: 1), contentMode: .fill)
                .padding(0)
                .cornerRadius(10)
                
                
        }
        else{
            Image(systemName: "hanger")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .padding(25)
                .cornerRadius(10)
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

struct URLitemDetailImage: View {
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
