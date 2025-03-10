//
//  ContentView.swift
//  TiendaOnline_JoseLopezVilchez
//
//  Created by dam2 on 7/3/25.
//

/*
 Partiendo del ejercicio "Tienda online: vistas": añadir TabBar para incorporar nuevas funcionalidades:
  - Implementar carrito de compra en el que se puedan añadir y eliminar artículos. Además calculará el importe total del carrito.
  - Implementar lista de favoritos. Se deben poder añadir y eliminar artículos favoritos.
  - Además, el listado de artículos permitirá filtrar por categoría.
 */

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var productos : ListaProductos;
    @EnvironmentObject var carrito : ListaCompra;
    @AppStorage("favoritos") var favoritos = "";
    
    var body: some View {
        
        TabView {
            
            Tab("Tienda", systemImage: "house") {
                Tienda()
                    .environmentObject(productos)
                    .environmentObject(carrito)
            }
            
            Tab("Carrito", systemImage: "cart") {
                Carrito()
                    .environmentObject(productos)
                    .environmentObject(carrito)
            }

            Tab("Favoritos", systemImage: "star") {
                Favoritos()
                    .environmentObject(productos)
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ListaProductos())
        .environmentObject(ListaCompra())
}
