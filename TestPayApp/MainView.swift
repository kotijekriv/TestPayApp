//
//  ContentView.swift
//  TestPayApp
//
//  Created by Pero Radić on 12.06.2022..
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView{
            List{
                NavigationLink(destination: InAppPurchaseView(viewModel: InAppPurchaseViewModel())) {
                    Text("In-App Purchase")
                }
                NavigationLink(destination: InAppPurchaseView(viewModel: InAppPurchaseViewModel())) {
                    Text("Stripe&ApplePay")
                }
                NavigationLink(destination: InAppPurchaseView(viewModel: InAppPurchaseViewModel())) {
                    Text("Stripe&Card")
                }
            }
            .navigationTitle("MobilePayments")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
