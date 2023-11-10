//
//  FetchData.swift
//  corgi-shop
//
//  Created by Robin Schwenzfeier on 18.10.23.
//

import Foundation

class CorgiModel: ObservableObject{
    @Published var corgis: [Corgi] = []
    
    func fetch(){
        guard let url = URL(string: "http://localhost:5050/api/corgis")
        else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){[weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let corgis = try JSONDecoder().decode([Corgi].self, from: data)
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
