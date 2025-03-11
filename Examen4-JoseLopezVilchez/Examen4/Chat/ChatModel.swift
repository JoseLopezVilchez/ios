//
//  ChatModel.swift
//  Examen4
//
//  Created by Alfonso Marín on 13/3/24.
//

import Foundation

struct Message : Identifiable {
    let id: UUID
    let senderName: String
    let content: String
    let timestamp: Date
}

class ChatModel : ObservableObject {
    var messages: [Message]

    init() {
        // Inicializa la lista de mensajes
        messages = [
            Message(id: UUID(), senderName: "Paco", content: "¡Hola! ¿Cómo estás?", timestamp: Date()),
            Message(id: UUID(), senderName: "Mari", content: "¡Hola! Estoy bien, ¿y tú?", timestamp: Date().addingTimeInterval(5)),
            Message(id: UUID(), senderName: "Paco", content: "También estoy bien, gracias por preguntar.", timestamp: Date().addingTimeInterval(10))
        ]
    }

    
}
