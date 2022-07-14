//
//  InAppPurchaseModel.swift
//  TestPayApp
//
//  Created by Pero Radić on 15.06.2022..
//

import Foundation

struct InAppPurchaseModel: Codable {
    
    struct Item: Identifiable, Codable, Hashable {
        var name: String
        var price: Double
        var isSelected: Bool
        var id: Int
    }
    
}
