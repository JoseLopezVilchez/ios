//
//  FraseModel.swift
//  InformacionExterna
//
//  Created by dam2 on 3/12/24.
//

import Foundation;

struct FraseModel : Decodable { //Decodable es un protocolo que permite decodificar de json a la clase
    /* Este es el json a modelar
     {
       "error": "",
       "name": "Escuela de Tecnologías aplicadas es[tech]",
       "address": "C/ San Joaquín, nº 12",
       "city": "Linares",
       "training": [
         "DAM",
         "VJ"
       ],
       "image": "https://escuelaestech.es/wp-content/uploads/2019/07/logo-estech-simple.png"
     }
     */
    
    let error : String;
    let nombre : String;
    let direccion : String;
    let ciudad : String;
    let training : [String];
    let imagen : String;
    
    enum CodingKeys : String, CodingKey { //Esto es para ponerle 'etiquetas', de forma que los atributos no tengan por qué ser del mismo nombre que los valores del json
        case error;
        case nombre = "name";
        case direccion = "address";
        case ciudad = "city";
        case training;
        case imagen = "image";
    }
}

extension FraseModel { //Esto es para decodificar de forma personalizada
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self);
        self.error = try container.decode(String.self, forKey: .error);
        self.nombre = try container.decode(String.self, forKey: .nombre);
        self.direccion = try container.decode(String.self, forKey: .direccion);
        self.ciudad = try container.decode(String.self, forKey: .ciudad);
        self.training = try container.decode([String].self, forKey: .training);
        self.imagen = try container.decode(String.self, forKey: .imagen);
    }
}
