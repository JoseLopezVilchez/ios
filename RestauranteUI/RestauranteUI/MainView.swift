//
//  MainView.swift
//  RestauranteUI
//
//  Created by dam2 on 20/2/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            
            //vista de pedido
            OrderView()
                .tabItem {
                    Label("Pedido", systemImage: "cart")
                }
        }
    }
}

#Preview {
    MainView()
        .environmentObject(Order())
}
