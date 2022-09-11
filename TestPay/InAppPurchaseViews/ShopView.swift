//
//  ShopView.swift
//  TestPay
//
//  Created by Pero Radić on 07.09.2022..
//

import SwiftUI
import StoreKit

struct ShopView: View {
    @EnvironmentObject var store: Store
    var productType: ProductTypes
    var shopTitle: String = "unknown"
    
    var arrayOfProducts: [Product] {
        switch productType {
        case .nonConsumable:
            return store.nonConsumableItems
        case .consumable:
            return store.consumableItems
        case .autoRenewable:
            return store.autoRenewableSubs
        case .nonRenewable:
            return store.nonRenewableSubs
        }
    }
    
    init(for productType: ProductTypes, withTitle title: String) {
        self.productType = productType
        self.shopTitle = title
    }
    
    var body: some View {
        List {
            ForEach(arrayOfProducts){ item in
                HStack{
                    Text(store.getEmojiFromProductId(item.id))
                        .font(.system(size: 50))
                    Text(item.displayName)
                        .padding()
                    Spacer()
                    Button(store.isPurchased(item) ? "Kupljeno!" : "Kupi za \n(\(item.displayPrice))") {
                        if !store.isPurchased(item) {
                            store.purchase(item)
                        }
                    }
                }
            }
        }
        .navigationTitle(shopTitle)
        
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView(for: .nonRenewable, withTitle: "Butiga")
    }
}

enum ProductTypes {
    case nonConsumable
    case consumable
    case autoRenewable
    case nonRenewable
}
