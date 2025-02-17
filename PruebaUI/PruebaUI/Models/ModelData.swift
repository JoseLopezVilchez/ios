//
//  ModelData.swift
//  PruebaUI
//
//  Created by dam2 on 11/2/25.
//

import Foundation

@Observable
class ModelData {
    var landmarks : [Landmark] = load("landmarkData.json");
}

func load<T : Decodable> (_ filename : String) -> T {
    let data : Data;
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("No se ha podido encontrar el ficero \(filename)");
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
