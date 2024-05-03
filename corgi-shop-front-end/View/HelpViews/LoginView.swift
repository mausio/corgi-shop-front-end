//
//  LoginView.swift
//  corgi-shop-front-end
//
//  Created by Robin Schwenzfeier on 01.05.24.
//

import SwiftUI
import SwiftData


struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    
    @Environment(\.modelContext) private var context
    
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
            
            Button("Login"){
                let user = UserModel(mail: email, password: password)
                
                deleteAllUsers()
        
                context.insert(user)
                
                do {
                    try context.save()
                } catch{
                    print(error.localizedDescription)
                }
                
                
                
                for singleUser in users {
                    print(singleUser.mail)
                }
                
            }
            .fontWeight(.medium)
            .padding(.vertical, 12)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .background(.tint, in: .rect(cornerRadius: 14, style: .continuous))
            
            
            Spacer()
        }
        .padding()
    }
}


#Preview ("Main View") {
    LoginView()
        .modelContainer(for: [UserModel.self])
}
