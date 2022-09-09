//
//  PurchasedItemView.swift
//  TestPay
//
//  Created by Pero Radić on 03.09.2022..
//

import SwiftUI
import StoreKit

struct PurchasedItemView: View {
    
    var name: String = ""
    var description: String = ""
    var emoji: String = ""
    
    var body: some View {
        
        VStack{
            Spacer()
            Text(emoji)
                .font(.system(size: 150))
                .padding(50)
            Text(name)
                .font(.title)
                .padding(50)
            Text(description)
                .font(.body)
                .padding(50)
            Spacer()
        }
    }
}

struct PurchasedItemView_Previews: PreviewProvider {
    static var previews: some View {
        PurchasedItemView(name: "Avion", description: "Ja sam vlak šta zgazit če te mali",emoji: "🛩")
    }
}
