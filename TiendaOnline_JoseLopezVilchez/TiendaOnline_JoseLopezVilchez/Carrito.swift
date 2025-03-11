//
//  Carrito.swift
//  TiendaOnline_JoseLopezVilchez
//
//  Created by dam2 on 7/3/25.
//

import SwiftUI

struct Carrito: View {
    
    @EnvironmentObject var productos : ListaProductos;
    @EnvironmentObject var carrito : ListaCompra;
    
    var body: some View {
        List {
            ForEach(carrito.productos) { item in
                
                if (productos.contains(idProducto: item.id)) {
                    
                    let producto : Producto = productos.find(idProducto: item.id)!;
                    
                    Celda(producto: producto)
                        .swipeActions (edge: .leading) {
                            Button ("Eliminar") {
                                carrito.remove(producto: producto)
                            }
                            .tint(.red)
                        }
                    Text("Cantidad: \(item.cantidad)")
                } else {
                    Text("Su carrito está vacío")
                }
            }
        }
        .navigationTitle("Carrito")
        .listStyle(.insetGrouped)
        
        Text("Precio total: \(String(format: "%.2f", carrito.precioTotal))")
    }
}

#Preview {
    Carrito()
        .environmentObject(ListaProductos())
        .environmentObject(ListaCompra())
}
