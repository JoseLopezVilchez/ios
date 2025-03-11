//
//  Model.swift
//  TiendaOnline_JoseLopezVilchez
//
//  Created by dam2 on 7/3/25.
//

/*
 "id":1,
 "title":"Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
 "price":109.95,
 "description":"Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
 "category":"men's clothing",
 "image":"https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
 "rating":{
    "rate":3.9,
    "count":120
 }
 */

import Foundation

struct Producto : Decodable, Identifiable, Hashable {
    let id : Int;
    let title : String;
    let price : Double;
    let description : String;
    let category : String;
    let image : String;
    let rating : Rating;
}

struct Rating : Decodable, Hashable {
    let rate : Double;
    let count : Int;
}

struct EntradaListaCompra : Decodable, Identifiable {
    let id : Int;
    var cantidad : Int;
    let precio : Double;
    
    var total : Double {
        get {
            return Double(cantidad) * precio;
        }
    }
}

/*struct FavList : Decodable, CustomStringConvertible {
    
    public var favoritos : [Int];
    
    public static func contains(json : String) -> FavList {
        
        let decoder = JSONDecoder();
        if let jsonData = json.data(using: .utf8) {
            if let decodedList = try? decoder.decode(FavList.self, from: jsonData) {
                return decodedList
            }
        }
        return FavList(favoritos: []);
    }
    
    public var description: String {
        get {
            return favoritos.reduce("") { $0 + "\($1)," }
        }
    }
}*/
