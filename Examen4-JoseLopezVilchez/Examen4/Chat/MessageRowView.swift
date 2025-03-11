//
//  MessageRowView.swift
//  Examen4
//
//  Created by Alfonso Marín on 13/3/24.
//

import SwiftUI

struct MessageRow: View {
    
    let message: Message;
    let color : Color;

    var body: some View {
        
        ZStack {
            color
            VStack {
                HStack {
                    Text("\(color == Color.blue ? "Yo" : message.senderName)")
                        .font(.callout)
                        .foregroundStyle(Color.white)
                    Spacer()
                }
                Text(message.content)
                    .font(.title2)
                    .foregroundStyle(Color.white)
                HStack {
                    Text(dateToString(date: message.timestamp))
                        .font(.caption)
                        .foregroundStyle(Color.white)
                    Spacer()
                }
            }
            .padding([.leading, .trailing])
        }
        .cornerRadius(10)
    }
    
    func dateToString (date: Date) -> String {
        let dateFormatter = DateFormatter();
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss";
        return dateFormatter.string(from: date);
    }
    
}

#Preview {
    MessageRow(message: Message(id: UUID(), senderName: "Paco", content: "¡Hola! ¿Cómo estás?", timestamp: Date()), color: .blue)
}
