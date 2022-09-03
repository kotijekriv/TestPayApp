//
//  ContentView.swift
//  TestPay
//
//  Created by Pero Radić on 29.08.2022..
//

import SwiftUI

struct StoreView: View {
    var body: some View {
        NavigationView{
            VStack{
                
                List {
                    Section("Vlakovi") {
                        NavigationLink ("Kupljeni artikl") {
                            PurchasedItemView()
                        }
                    }
                    
                    Section("Pogonsko gorivo") {
                        NavigationLink ("Kupljeni artikl") {
                            PurchasedItemView()
                        }
                    }
                    
                    Section("Pretplata za struju") {
                        NavigationLink ("Kupljeni artikl") {
                            PurchasedItemView()
                        }
                    }
                    
                    Section("Pretplata za servis") {
                        NavigationLink ("Kupljeni artikl") {
                            PurchasedItemView()
                        }
                    }
                }
                
                VStack{
                    
                    Text("Trgovina")
                    
                    HStack {
                        NavigationLink {
                            ConsumableItemShopView()
                        } label: {
                            Label("Vlakovi", systemImage: "cart")
                        }.padding()
                        
                        Spacer()
                        
                        NavigationLink {
                            ConsumableItemShopView()
                        } label: {
                            Label("Struja", systemImage: "cart")
                        }.padding()
                    }
                    HStack {
                        NavigationLink {
                            ConsumableItemShopView()
                        } label: {
                            Label("Gorivo", systemImage: "cart")
                        }.padding()
                        
                        Spacer()
                        
                        NavigationLink {
                            ConsumableItemShopView()
                        } label: {
                            Label("Servis", systemImage: "cart")
                        }.padding()
                    }
                }
                
            }
            .navigationTitle("Skladište")
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}
