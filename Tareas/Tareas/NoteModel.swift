//
//  NoteModel.swift
//  Tareas
//
//  Created by dam2 on 4/3/25.
//

import Foundation

struct NoteModel : Codable {
    let id : String; //identificador unico por nota
    var isFavorited : Bool;
    let description : String;
    
    init(id: String = UUID().uuidString, isFavorited: Bool = false, description: String) {
        self.id = id;
        self.isFavorited = isFavorited;
        self.description = description;
    }
}
