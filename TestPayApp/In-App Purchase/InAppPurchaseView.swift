//
//  InAppPurchaseView.swift
//  TestPayApp
//
//  Created by Pero Radić on 12.06.2022..
//

import SwiftUI


struct InAppPurchaseView: View {
    
    @ObservedObject var viewModel: InAppPurchaseViewModel
    
    var body: some View {
        VStack{
            List{
                ForEach(viewModel.items){ item in
                    HStack{
                        Text("Ovdje ide item")
                        Spacer()
                        Button(item.isSelected ? "Remove" : "Add") {
                            viewModel.selectItem(item)
                        }
                    }
                }
            }
            
            Button("Pay"){
                
            }
            .padding()
        }
        
        
    }
}

struct InAppPurchaseView_Previews: PreviewProvider {
    static var previews: some View {
        InAppPurchaseView(viewModel: InAppPurchaseViewModel())
    }
}
