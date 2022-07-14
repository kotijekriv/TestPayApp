//
//  InAppPurchaseViewModel.swift
//  TestPayApp
//
//  Created by Pero Radić on 15.06.2022..
//

import SwiftUI

class InAppPurchaseViewModel: ObservableObject {
    
    @Published var items = [InAppPurchaseModel.Item]()
    
    init(){
        if items.isEmpty{
            insertItem(named: "iPhone 14", forPrice: 1000)
            insertItem(named: "iPhone 15", forPrice: 1500)
            insertItem(named: "iPhone 13", forPrice: 2950)
        }
        
    }
    
    func selectItem(_ item: InAppPurchaseModel.Item){
        if let index = items.firstIndex(of: item) {
            items[index].isSelected = !items[index].isSelected
        }
    }
    
    // MARK: -Intent
    
    func insertItem(named name: String, forPrice price: Double, at index: Int = 0, isSelected: Bool = false){
        let unique = (items.max(by: { $0.id < $1.id })?.id ?? 0) + 1
        let item = InAppPurchaseModel.Item(name: name, price: price, isSelected: isSelected, id: unique)
        let safeIndex = min(max(index, 0), items.count)
        items.insert(item, at: safeIndex)
    }
    
    @discardableResult
    func removeItem(at index: Int) -> Int{
        if items.count > 1, items.indices.contains(index) {
            items.remove(at: index)
        }
        return index % items.count
    }
    
}
