//
//  CorgiView.swift
//  corgi-shop
//
//  Created by Robin Schwenzfeier on 19.10.23.
//

import SwiftUI
import SwiftData

struct CorgiDetail: View {
    var corgi: Corgi
    
    let darkColor = Color("darkColor")
    let lightColor = Color("lightColor")
    let accentColorTo = Color("accentColorTo")
    
    @Environment(\.modelContext) private var context
    
    @Query private var cartModel: [CartModel]
    
    
    
    var body: some View {
            
            ScrollView{
                ZStack{
                    if let corgiImageUrl = corgi.imageUrl {
                        URLCorgiDetailImage(urlString: corgiImageUrl)
                    }
                    
                }.ignoresSafeArea()
                
                
                    
                VStack(alignment: .leading){
                    VStack(alignment: .leading){
                        HStack(spacing: 20){
                            if let corgiName = corgi.name {
                                Text(corgiName)
                                    .font(.title)
                                    .fontWeight(.bold)
                            } else{
                                Text("Cute Corgi Name")
                            }
                            
                            Spacer()
                            
                            Button{
                                
                                let existingItem = cartModel.first { $0.id == corgi.id }
                                
                                if existingItem == nil {
                                    let newItem = CartModel(id: corgi.id, name: corgi.name, price: corgi.price, descrip: corgi.description, imageUrl: corgi.imageUrl, isCorgi: true, amount: 1)
                                    context.insert(newItem)
                                } else {
                                    // Item already exists in the cart, handle accordingly (e.g., show a message)
                                    print("Item already exists in the cart.")
                                }
                                
                            } label: {
                                Image(systemName: "cart")
                                    .fontWeight(.bold)
                                    .padding()
                                    .foregroundColor(darkColor)
                                    .background(lightColor)
                                    .cornerRadius(10)
                            }
                                
                        
                            Image(systemName: "star")
                                .fontWeight(.bold)
                                .foregroundColor(accentColorTo)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(accentColorTo, lineWidth: 3)
                                )
                                
                        
                        }
                        
                        HStack{
                            if let corgiType = corgi.coatColor {
                                Text(corgiType)
                                    .foregroundStyle(.secondary)
                            }
                            if let corgiSex = corgi.male {
                                Text(corgiSex ? "(he/him)" : "(she/her)")
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                                    .fontWeight(.light)
                            }
                        }
                    }
                            
                    Spacer(minLength: 25)
                    Divider()
                    Spacer()
                    
                        Grid {
                            GridRow {
                                if let corgiPrice = corgi.price {
                                        Text("Price: ")
                                        .fontWeight(.bold)
                                        
                                    Text("\(corgiPrice)€")
                                        .fontWeight(.bold)
                                }
                                Spacer()
                                if let corgiWeight = corgi.weight {
                                        Text("Weight: ")
                                    Text("\(corgiWeight)kg")
                                }
                            }
                            .gridColumnAlignment(.leading)
                    
                            Divider()
                            
                            GridRow {
                                if let corgiBirthdate = corgi.birthdate {
                                        Text("Birthdate: ")
                                    Text("\(corgiBirthdate)")
                                    //TODO: Birthdate has to be re-formatted before being used / displaying
                                }
                                Spacer()
                                if let corgiHeight = corgi.height {
                                        Text("Height: ")
                                    Text("\(corgiHeight)cm")
                                }
                            }

                        }
                        
                    
                    
                    Spacer()
                    Divider()
                    Spacer(minLength: 25)
                        
                    if let corgiDescription = corgi.description {
                        Text(corgiDescription)
                    }else{
                        Text("Corgi Description")
                    }
                    }
                    .padding(.top, 25)
                    .padding(.horizontal, 25)
                    .padding(.bottom, 200)
                    .background()
                    .cornerRadius(20)
                    .offset(y: -50)
     
            }
            .ignoresSafeArea()
            
        
    }
}

#Preview("Niklas") {
//    let corgiModel = CorgiModel()
//    corgiModel.fetch()
//    
//    if let corgi = corgiModel.corgis.first{
//        return  CorgiDetail(corgi: corgi)
//    }
    
    CorgiDetail(corgi: Corgi(id: 1, name: "Niklas", price: 1000, description: "Niklas, the Corgi, is an absolute gem of a canine companion, a delightful friend who brightens the days of everyone lucky enough to be in his company. This lovable ball of fur possesses an irresistible charm that's impossible to resist. His striking appearance, with those short legs and expressive eyes, makes him undeniably cute – a real heart-mealter. Niklas, while being an expert in cuteness, is also quite the intelligent one. Just like his human companion, who studies Informatik, he's got a knack for being clever. You can see it in his eyes; there's a curious and inquisitive glint that suggests he's always thinking and eager to learn new tricks and commands. The bond between Niklas and his human is something truly special. They share moments of laughter, joy, and companionship that go beyond words. Niklas's loyalty knows no bounds, and he's always there to brighten up those study sessions with his presence. In his own way, he reminds his human to take breaks and enjoy the simpler things in life, like a game of fetch or a leisurely walk. Niklas, in addition to his intelligence and cuteness, has a personality that's larger than life, much like his Pembroke Welsh Corgi lineage. He's a social butterfly, getting along well with everyone he meets. His playfulness and enthusiasm are infectious, making friends wherever he goes. Niklas is not just a dog; he's a cherished family member. His affectionate nature and constant desire to be by his human's side make him the perfect study buddy. With his wagging tail and loving gaze, he offers encouragement during those late-night coding sessions and provides a much-needed source of stress relief. This Corgi named Niklas is more than just a pet; he's a source of unconditional love and a reminder that even in the world of Informatik, there's always room for some adorable distractions and furry companionship.", imageUrl: "https://i.pinimg.com/736x/cf/bb/02/cfbb02c3afedccfcb6b5e1544e658bf3.jpg", birthdate: "01.01.2010", coatColor: "Cardigan",  weight: 10,  height: 40, male: false))        .modelContainer(for: [CartModel.self])
}


