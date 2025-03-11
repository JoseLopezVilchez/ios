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
    @State var categoriaSeleccionada : String = "";
    
    var body: some View {
        
        Picker("Categoría", selection: $categoriaSeleccionada) {
            ForEach(productos.categorias, id: \.self) {
                Text($0)
            }
        }
        .pickerStyle(.wheel)
        
        NavigationStack {
            List {
                ForEach(productos.filtro(categoria: [categoriaSeleccionada])) { item in
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
                                    var lista = decode(json: favoritos);
                                    
                                    if (!lista.contains(item.id)) {
                                        lista.append(item.id);
                                        favoritos = encode(listado: lista);
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
