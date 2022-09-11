//
//  ContentView.swift
//  TestPay
//
//  Created by Pero Radić on 29.08.2022..
//

import SwiftUI

struct StockView: View {
    
    @StateObject var store: Store = Store()
    
    var body: some View {
        NavigationView{
            VStack{
                
                List {
                    Section("Vlakovi") {
                        ForEach(store.purchasedNonConsumableItems) { item in
                            NavigationLink (item.displayName) {
                                PurchasedItemView(name: item.displayName,
                                                  description: item.description,
                                                  emoji: store.getEmojiFromProductId(item.id))
                            }
                        }
                    }
                    
                    Section("Pogonsko gorivo") {
                        ForEach(store.consumableItems) { item in
                            HStack{
                                Text(item.displayName)
                                Spacer()
                                Text("\(store.getQuantityFor(productId: item.id))")
                            }
                        }
                    }
                    
                    Section("Pretplata za struju") {
                        ForEach(store.purchasedAutoRenewableSubs) { item in
                            NavigationLink (item.displayName) {
                                PurchasedItemView(name: item.displayName,
                                                  description: item.description,
                                                  emoji: store.getEmojiFromProductId(item.id))
                            }
                        }
                    }
                    
                    Section("Pretplata za servis") {
                        ForEach(store.purchasedNonRenewableSubs) { item in
                            NavigationLink (item.displayName) {
                                PurchasedItemView(name: item.displayName,
                                                  description: item.description,
                                                  emoji: store.getEmojiFromProductId(item.id))
                            }
                        }
                    }
                }
                
                VStack{
                    
                    Text("Trgovina")
                    
                    HStack {
                        NavigationLink {
                            ShopView(for: .nonConsumable,
                                        withTitle: "Trgovina vlakova")
                        } label: {
                            Label("Vlakovi", systemImage: "cart")
                        }.padding()
                        
                        Spacer()
                        
                        NavigationLink {
                            ShopView(for: .autoRenewable,
                                        withTitle: "Elektroprivreda")
                        } label: {
                            Label("Struja", systemImage: "cart")
                        }.padding()
                    }
                    HStack {
                        NavigationLink {
                            ShopView(for: .consumable,
                                        withTitle: "Dobavljač goriva")
                        } label: {
                            Label("Gorivo", systemImage: "cart")
                        }.padding()
                        
                        Spacer()
                        
                        NavigationLink {
                            ShopView(for: .nonRenewable,
                                        withTitle: "Serviser vlakova")
                        } label: {
                            Label("Servis", systemImage: "cart")
                        }.padding()
                    }
                }
            }
            .navigationTitle("Skladište")
        }
        .environmentObject(store)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StockView()
    }
}
