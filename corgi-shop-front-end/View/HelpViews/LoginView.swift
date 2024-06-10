//
//  LoginView.swift
//  corgi-shop-front-end
//
//  Created by Robin Schwenzfeier on 01.05.24.
//

import SwiftUI
import SwiftData


struct LoginView: View {
    @State var email: String = "user"
    @State var password: String = "user"
  @State private var hasError: Bool = false
    
    @Environment(\.modelContext) private var context
  @Environment(\.dismiss) private var dismiss
    
    @Query private var users: [UserModel]
  


    
    private func deleteAllUsers(){
        do {
            try context.delete(model: UserModel.self)
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    var body: some View {
        VStack{
            HStack{
                Text("LOGIN")
                    .font(.title2)
                    .bold()
                    .multilineTextAlignment(.leading)
                    .padding(10)
                Spacer()
            }
            
            Spacer()
            
            Form{
                Section{
                    TextField("Mail", text: $email)
                    SecureField("Password", text: $password)
                } header: {
                    Text("Fill in your credentials:")
                }
                
            }
            .frame(maxWidth: .infinity)
            .cornerRadius(10)
          
          if hasError {
              Text("Login failed. Please try again.")
                  .foregroundColor(.red)
          }
            
            Button("Login"){
              
                let user = UserModel(mail: email, password: password)
                
                deleteAllUsers()
        
                signIn(mail: email, password: password)
                
                for singleUser in users {
                    print(singleUser.mail)
                  print(singleUser.password)
                }
                
            }
            .fontWeight(.medium)
            .padding(.vertical, 12)
            .padding(.horizontal, 140)
            .foregroundStyle(.white)
            .background(.tint, in: .rect(cornerRadius: 14, style: .continuous))
            
            
          
            Spacer()
        }
        .padding()
    }
  
  private func signIn(mail: String, password: String) {
      // Simulate network sign-in process
      let user = UserModel(mail: mail, password: password)
      context.insert(user)
    
    do {
        try context.save()
    } catch{
        print(error.localizedDescription)
      hasError = true
      return
    }
      
      DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
          // Assuming successful login
          hasError = false
        print("successful login")
          dismiss()
      }
  }
}



#Preview ("Main View") {
    LoginView()
        .modelContainer(for: [UserModel.self])
}
