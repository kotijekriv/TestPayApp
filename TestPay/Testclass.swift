//
//  Testclass.swift
//  TestPay
//
//  Created by Pero Radić on 05.09.2022..
//

import Foundation
import StoreKit


//class Store: ObservableObject {
//    
//    @Published private(set) var nonConsumableItems: [Product] = []
//    @Published private(set) var consumableItems: [Product] = []
//    @Published private(set) var autoRenewableSubs: [Product] = []
//    @Published private(set) var nonRenewableSubs: [Product] = []
//    
//    @Published private(set) var purchasedNonConsumableItems: [Product] = []
//    @Published private(set) var purchasedAutoRenewableSubs: [Product] = []
//    @Published private(set) var purchasedNonRenewableSubs: [Product] = []
//    
//    private var productIdAndEmoji: [String : String] = [:]
//    
//}

//VStack{
//
//Text("Trgovina")
//
//HStack {
//    NavigationLink {
//        ShopView(for: .nonConsumable,
//                    withTitle: "Trgovina vlakova")
//    } label: {
//        Label("Vlakovi", systemImage: "cart")
//    }.padding()
//
//    Spacer()
//
//    NavigationLink {
//        ShopView(for: .autoRenewable,
//                    withTitle: "Elektroprivreda")
//    } label: {
//        Label("Struja", systemImage: "cart")
//    }.padding()
//}
//HStack {
//    NavigationLink {
//        ShopView(for: .consumable,
//                    withTitle: "Dobavljač goriva")
//    } label: {
//        Label("Gorivo", systemImage: "cart")
//    }.padding()
//
//    Spacer()
//
//    NavigationLink {
//        ShopView(for: .nonRenewable,
//                    withTitle: "Serviser vlakova")
//    } label: {
//        Label("Servis", systemImage: "cart")
//    }.padding()
//}
//}

//NavigationView{
//    VStack{
//        List {
//            Section("Vlakovi") {
//                ForEach(store.purchasedNonConsumableItems) { item in
//                    NavigationLink (item.displayName) {
//                        PurchasedItemView(name: item.displayName,
//                                          description: item.description,
//                                          emoji: store.getEmojiFromProductId(item.id))
//                    }
//                }
//            }
//            
//            Section("Pogonsko gorivo") {
//                NavigationLink ("Kupljeni artikl") {
//                    PurchasedItemView()
//                }
//            }
//            
//            Section("Pretplata za struju") {
//                ForEach(store.purchasedAutoRenewableSubs) { item in
//                    NavigationLink (item.displayName) {
//                        PurchasedItemView(name: item.displayName,
//                                          description: item.description,
//                                          emoji: store.getEmojiFromProductId(item.id))
//                    }
//                }
//            }
//            
//            Section("Pretplata za servis") {
//                ForEach(store.purchasedNonRenewableSubs) { item in
//                    NavigationLink (item.displayName) {
//                        PurchasedItemView(name: item.displayName,
//                                          description: item.description,
//                                          emoji: store.getEmojiFromProductId(item.id))
//                    }
//                }
//            }
//        }
//        .navigationTitle("Skladište")
//    }
