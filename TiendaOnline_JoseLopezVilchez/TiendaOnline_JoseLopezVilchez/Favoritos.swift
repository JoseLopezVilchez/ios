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
            ForEach (decode(json: favoritos), id: \.self) { item in
                
                if (productos.contains(idProducto: item)) {
                    
                    let producto : Producto = productos.find(idProducto: item)!;
                    
                    Celda(producto: producto)
                        .swipeActions (edge: .leading) {
                            Button ("Eliminar") {
                                /*var fav = favoritos.split(separator: ",");
                                if let index = fav.firstIndex(where: { $0 == "\(item.id)" }) {
                                    fav.remove(at: index);
                                    favoritos = fav.joined(separator: ",");
                                } else {
                                    favoritos.append(",\(item.id)");
                                }*/
                                var lista = decode(json: favoritos);
                                lista.removeAll(where: { item == $0 });
                                favoritos = encode(listado: lista);
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
}

func decode(json : String) -> [Int] {
    
    let decoder = JSONDecoder();
    if let jsonData = json.data(using: .utf8) {
        if let decodedList = try? decoder.decode([Int].self, from: jsonData) {
            return decodedList
        }
    }
    return [];
}

func encode (listado : [Int]) -> String {
    
    if let jsonData = try? JSONEncoder().encode(listado), let jsonString = String(data: jsonData, encoding: .utf8) {
        return jsonString;
    }
    return "";
}

#Preview {
    Favoritos()
        .environmentObject(ListaProductos())
        .environmentObject(ListaCompra())
}
