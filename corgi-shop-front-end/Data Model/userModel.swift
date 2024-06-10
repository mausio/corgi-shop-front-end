//
//  userModel.swift
//  corgi-shop-front-end
//
//  Created by Robin Schwenzfeier on 01.05.24.
//

import Foundation

import SwiftData

fileprivate struct SignInResponse: Decodable {

    // MARK: - Properties

    let accessToken: String

}

@Model
final class UserModel {
    var mail: String
    var password: String
  var username: String?
  var hasError: Bool?
  var isSignedIn: Bool?
  
  init(mail: String, password: String){
    self.mail = mail;
    self.password = password
    self.username = "";
    self.hasError = false
    self.isSignedIn = false
    
    guard !mail.isEmpty && !password.isEmpty else {
      return
    }
    
    var request = URLRequest(url: URL(string: "https://corgi.melonigemelone.de/api/user/signIn")!)
    
    request.httpMethod = "POST"
    
    let authData = (mail + ":" + password).data(using: .utf8)!.base64EncodedString()
    request.addValue("Basic \(authData)", forHTTPHeaderField: "Authorization")
    
    // Prepare JSON body
    let body: [String: String] = ["playerName": mail.lowercased(), "password": password]
    do {
        request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    } catch {
        print("Error: unable to add JSON body to request: \(error)")
        self.hasError = true
        return
    }
    
    
    
    URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
      DispatchQueue.main.async {
        if error != nil || (response as! HTTPURLResponse).statusCode != 200 {
          self?.hasError = true
        } else if let data = data {
          do {
            print(data)
            
            if let booleanResponse = try? JSONDecoder().decode(Bool.self, from: data) {
              
              if booleanResponse {
                print("Sign in succeeded with boolean response.")
                self?.isSignedIn = true
              } else {
                print("Sign in failed with boolean response.")
                self?.hasError = true
              }
              
            } else {
              let signInResponse = try JSONDecoder().decode(SignInResponse.self, from: data)
              print("sign in response: ")
              print(signInResponse)
            }
            
          } catch {
            print("Unable to Decode Response \(error)")
            self?.hasError = true
          }
        }
      }
    }.resume()
  }
}
