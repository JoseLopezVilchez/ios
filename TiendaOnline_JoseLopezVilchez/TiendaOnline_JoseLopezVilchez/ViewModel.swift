//
//  ViewModel.swift
//  TiendaOnline_JoseLopezVilchez
//
//  Created by dam2 on 7/3/25.
//

import Foundation

class ListaProductos : ObservableObject {
    @Published var productos : [Producto] = load("productos.json");
    
    var categorias : [String] {
        get {
            return productos.reduce([], {
                if (!$0.contains($1.category)) {
                    var array : [String] = $0;
                    array.append($1.category)
                    return array;
                }
                return $0;
            })
        }
    }
    
    public func contains (idProducto : Int) -> Bool {
        return productos.contains(where: { $0.id == idProducto });
    }
    
    public func find (idProducto : Int) -> Producto? {
        return productos.first(where: { $0.id == idProducto });
    }
    
    public func filtro (categoria : [String]) -> [Producto] {
        if (categoria.isEmpty || categoria[0].isEmpty) {
            return productos;
        }
        return productos.filter { categoria.contains($0.category) };
    }
}

class ListaCompra : ObservableObject {
    @Published var productos : [EntradaListaCompra] = [];
    
    var precioTotal : Double {
        get {
            return productos.reduce(0) { $0 + $1.total };
        }
    }
    
    public func add (producto : Producto) {
        if let encontrado = productos.firstIndex(where: { $0.id == producto.id }) {
            productos[encontrado].cantidad += 1;
        } else {
            productos.append(EntradaListaCompra(id: producto.id, cantidad: 1, precio: producto.price));
        }
    }
    
    public func remove (producto : Producto) {
        productos.removeAll { $0.id == producto.id };
    }
    
    public func contains (idProducto : Int) -> Bool {
        return productos.contains(where: { $0.id == idProducto });
    }
}

func load<T : Decodable> (_ filename : String) -> T {
    let data : Data;
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("No se ha podido encontrar el fichero \(filename)");
    }
    
    do {
        data = try Data(contentsOf: file);
    } catch {
        fatalError("No se he podido leer el fichero \(filename) \(error)");
    }
    
    do {
        let decoder = JSONDecoder();
        return try decoder.decode(T.self, from: data);
    } catch {
        fatalError("No se ha podido pasar el fichero \(filename) como \(T.self):\n\(error)");
    }
}
