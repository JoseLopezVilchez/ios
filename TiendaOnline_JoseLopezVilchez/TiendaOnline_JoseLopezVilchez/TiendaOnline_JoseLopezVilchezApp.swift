//
//  TiendaOnline_JoseLopezVilchezApp.swift
//  TiendaOnline_JoseLopezVilchez
//
//  Created by dam2 on 7/3/25.
//

import SwiftUI

@main
struct TiendaOnline_JoseLopezVilchezApp: App {
    
    @StateObject var productos = ListaProductos();
    @StateObject var carrito = ListaCompra();
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(productos)
                .environmentObject(carrito)
        }
    }
}
