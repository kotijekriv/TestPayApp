//
//  Store.swift
//  TestPay
//
//  Created by Pero Radić on 30.08.2022..
//

import Foundation
import StoreKit

class Store: ObservableObject {
    
    @Published private(set) var nonConsumableItems: [Product] = []
    @Published private(set) var consumableItems: [Product] = []
    @Published private(set) var autoRenewableSubs: [Product] = []
    @Published private(set) var nonRenewableSubs: [Product] = []
    
    @Published private(set) var purchasedNonConsumableItems: [Product] = []
    @Published private(set) var purchasedAutoRenewableSubs: [Product] = []
    @Published private(set) var purchasedNonRenewableSubs: [Product] = []
    
    private var productIdAndEmoji: [String : String] = [:]
    
    init() {
        if productIdAndEmoji.isEmpty {
            productIdAndEmoji = ["com.testPay.coal": "🪵","com.testPay.disel": "⛽️","com.testPay.petrol": "⛽️"
                                 ,"com.testPay.steamEngine": "🚂","com.testPay.diselEngine": "🚈","com.testPay.petrolEngine": "🚅","com.testPay.electricEngine": "🚄"
                                 ,"com.testPay.summer22": "🛠","com.testPay.fall22": "🛠","com.testPay.winter23": "🛠"
                                 ,"com.testPay.electric.basic": "♻️","com.testPay.electric.pro": "⚡️","com.testPay.electric.max": "⚡️⚡️"]
        }
        
        Task {
            await fetchProducts()
            await updateAllProductsStates()
        }
    }
    
    @MainActor
    func fetchProducts() async {
        do {
            let productsFromStore  = try await Product.products(for: productIdAndEmoji.keys)
            
            var newNonConsumableItems: [Product] = []
            var newConsumableItems: [Product] = []
            var newSubscriptions: [Product] = []
            var newNonRenewables: [Product] = []
            
            for product in productsFromStore  {
                switch product.type {
                case .nonConsumable:
                    newNonConsumableItems.append(product)
                case .consumable:
                    newConsumableItems.append(product)
                case .autoRenewable:
                    newSubscriptions.append(product)
                case .nonRenewable:
                    newNonRenewables.append(product)
                default:
                    print("Error: unknown product type")
                }
            }
            
            self.nonConsumableItems = newNonConsumableItems
            self.consumableItems = newConsumableItems
            self.autoRenewableSubs = newSubscriptions
            self.nonRenewableSubs = newNonRenewables
            
        } catch {
            print("Error fetching products from AppStore: \(error)")
        }
        
    }
    
    @MainActor
    func updateAllProductsStates() async {
        var purchasedNonConsumableItems: [Product] = []
        var purchasedNonRenewableSubs: [Product] = []
        var purchasedAutoRenewableSubs: [Product] = []
        
        for await state in Transaction.currentEntitlements {
            
            switch state {
            case .unverified:
                print("Transaction is unverified!")
            case .verified(let transaction):
                switch transaction.productType {
                case .nonConsumable:
                    if let nonConsumableItem = nonConsumableItems.first(where: { $0.id == transaction.productID }) {
                        purchasedNonConsumableItems.append(nonConsumableItem)
                    }
                case .autoRenewable:
                    if let autoRenewableSub = autoRenewableSubs.first(where: { $0.id == transaction.productID }) {
                        purchasedAutoRenewableSubs.append(autoRenewableSub)
                    }
                case .nonRenewable:
                    if let nonRenewableSub = nonRenewableSubs.first(where: { $0.id == transaction.productID }) {
                        purchasedNonRenewableSubs.append(nonRenewableSub)
                    }
                default:
                    break
                }
            }
        }
        
        self.purchasedNonConsumableItems = purchasedNonConsumableItems
        self.purchasedAutoRenewableSubs = purchasedAutoRenewableSubs
        self.purchasedNonRenewableSubs = purchasedNonRenewableSubs
    }
    
    //MARK: Intents
    
    func purchase(_ product: Product) {
        
        Task{
            let result = try await product.purchase()
            
            switch result {
            case .success(let verification):
                
                switch verification {
                case .verified(let transaction):
                    
                    print("Successful transaction \(transaction.productID)")
                    
                    await updateAllProductsStates()
                    
                    await transaction.finish()
                    
                case .unverified(_,_):
                    print("Transaction is unverified")
                }
            case .userCancelled, .pending:
                print("Transaction Pending or userCanceled")
            default:
                print("Unknown error")
            }
        }
    }
    
    func isPurchased(_ product: Product) -> Bool {
        
        switch product.type {
        case .nonConsumable:
            return purchasedNonConsumableItems.contains(product)
        case .autoRenewable:
            return purchasedAutoRenewableSubs.contains(product)
        case .nonRenewable:
            return purchasedNonRenewableSubs.contains(product)
        default:
            return false
        }
    }
    
    func getEmojiFromProductId(_ id: String) -> String{
        return productIdAndEmoji[id] ?? "❓"
    }
}
