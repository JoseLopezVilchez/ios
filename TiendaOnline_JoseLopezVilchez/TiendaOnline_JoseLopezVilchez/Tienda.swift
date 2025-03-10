//
//  Tienda.swift
//  TiendaOnline_JoseLopezVilchez
//
//  Created by dam2 on 7/3/25.
//

/*
 Desarrollar una aplicación con SwiftUI capaz de representar un listado con el nombre, precio, categoría e imagen de los productos de productos.json.
 Al pulsar cada en uno de ellos debe aparecer una pantalla con todos los detalles del producto y un botón de compra.
 */

import SwiftUI

struct Tienda: View {
    
    @EnvironmentObject var productos : ListaProductos;
    @EnvironmentObject var carrito : ListaCompra;
    @AppStorage("favoritos") var favoritos = "";
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(productos.productos) { item in
                    NavigationLink(value: item) {
                        Celda(producto: item)
                            .swipeActions (edge: .leading) {
                                Button ("Comprar") {
                                    carrito.add(producto: item)
                                }
                                .tint(.blue)
                            }
                            .swipeActions (edge: .trailing) {
                                Button ("Favorito") {
                                    var fav = favoritos.split(separator: ",");
                                    if let index = fav.firstIndex(where: { $0 == "\(item.id)" }) {
                                        fav.remove(at: index);
                                        favoritos = fav.joined(separator: ",");
                                    } else {
                                        favoritos.append(",\(item.id)");
                                    }
                                }
                                .tint(.yellow)
                            }
                    }
                    
                }
            }
            .navigationTitle("Tienda")
            .listStyle(.insetGrouped)
            .navigationDestination(for: Producto.self) { producto in
                DetalleProducto(producto: producto)
                    .environmentObject(carrito)
            }
        }
        
        
    }
}

#Preview {
    Tienda()
        .environmentObject(ListaProductos())
        .environmentObject(ListaCompra())
}
