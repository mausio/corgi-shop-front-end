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
            
            print(data)
            
            do{
                var corgis = try JSONDecoder().decode([Corgi].self, from: data)
              
              corgis = corgis.map { corgi in
                   var mutableCorgi = corgi
                   mutableCorgi.uuid = UUID()
                   return mutableCorgi
               }
              
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
            print(data)
            do {
                var categories = try JSONDecoder().decode([Category].self, from: data)
                // Generate and assign UUIDs to each Category object
                categories = categories.map { category in
                    var mutableCategory = category
                  mutableCategory.items = mutableCategory.items.map{ item in
                    var mutableItem = item
                    mutableItem.uuid = UUID()
                    return mutableItem
                  }
                    return mutableCategory
                }
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
