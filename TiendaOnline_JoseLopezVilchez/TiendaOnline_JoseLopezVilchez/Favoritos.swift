//
//  Favoritos.swift
//  TiendaOnline_JoseLopezVilchez
//
//  Created by dam2 on 7/3/25.
//

import SwiftUI

struct Favoritos: View {
    
    @EnvironmentObject var productos : ListaProductos;
    @AppStorage("favoritos") var favoritos = "";
    
    var body: some View {
        List {
            ForEach (favSplitter(favoritos: favoritos), id: \.self) { item in
                
                if (productos.contains(idProducto: item)) {
                    
                    let producto : Producto = productos.find(idProducto: item)!;
                    
                    Celda(producto: producto)
                        .swipeActions (edge: .leading) {
                            Button ("Eliminar") {
                                var fav = favoritos.split(separator: ",");
                                if let index = fav.firstIndex(where: { $0 == "\(item.id)" }) {
                                    fav.remove(at: index);
                                    favoritos = fav.joined(separator: ",");
                                } else {
                                    favoritos.append(",\(item.id)");
                                }
                            }
                            .tint(.red)
                        }
                } else {
                    Text("Su carrito está vacío")
                }
            }
        }
        .navigationTitle("Carrito")
        .listStyle(.insetGrouped)
    }
    
    func favSplitter (favoritos : String) -> [Int] {
        let substrArray = favoritos.split(separator: ",");
        let strArray : [String] = substrArray.map({String($0)});
        let intArray : [Int] = strArray.map { Int($0)! };
        return intArray;
    }
}

#Preview {
    Favoritos()
        .environmentObject(ListaProductos())
        .environmentObject(ListaCompra())
}
