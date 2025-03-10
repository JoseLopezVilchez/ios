//
//  RestauranteUIApp.swift
//  RestauranteUI
//
//  Created by dam2 on 18/2/25.
//

import SwiftUI

@main
struct RestauranteUIApp: App {
    
    @StateObject var order = Order();
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
