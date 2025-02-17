//
//  FraseModel.swift
//  InformacionExterna
//
//  Created by mac-profesor on 3/12/24.
//

import Foundation

struct FraseModel: Decodable {
    let error: String
    let nombre: String
    let direccion: String
    let city: String
    let training: [String]
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case error
        case nombre = "name"
        case direccion = "address"
        case city
        case training
        case image
    }
}


extension FraseModel {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.error = try container.decode(String.self, forKey: .error)
        self.nombre = try container.decode(String.self, forKey: .nombre)
        self.direccion = try container.decode(String.self, forKey: .direccion)
        self.city = "Linares"
        self.training = try container.decode([String].self, forKey: .training)
        self.image = try container.decode(String.self, forKey: .image)
    }
}



