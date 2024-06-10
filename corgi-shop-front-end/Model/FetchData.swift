//
//  FetchData.swift
//  corgi-shop
//
//  Created by Robin Schwenzfeier on 18.10.23.
//

import Foundation

class CorgiModel: ObservableObject{
    @Published var corgis: [Corgi] = []
    let urlAddress = "https://corgi.melonigemelone.de/api/corgis"
    
    func fetch() {
        
        guard let url = URL(string: urlAddress)
        else{
            
            return
        }
        let task = URLSession.shared.dataTask(with: url){[weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            
            do{
                var corgis = try JSONDecoder().decode([Corgi].self, from: data)
              
                DispatchQueue.main.async {
                    
                    self?.corgis = corgis
                    
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
}


class MerchModel: ObservableObject {
    @Published var categories: [Category] = []
    
    let urlAddress = "https://corgi.melonigemelone.de/api/categories"
    
    func fetch() {
        guard let url = URL(string: urlAddress) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
              let categories = try JSONDecoder().decode([Category].self, from: data)
                DispatchQueue.main.async {
                    self?.categories = categories
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
