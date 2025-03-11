//
//  ChatView.swift
//  Examen4
//
//  Created by Alfonso Marín on 13/3/24.
//

import SwiftUI

struct ChatView: View {
    
    @EnvironmentObject var mensajes : ChatModel;
    @State private var field: String = "";
    
    let vista : String;

    var body: some View {
        
        List {
            ForEach(mensajes.messages) { mensaje in
                MessageRow(message: mensaje, color: mensaje.senderName == vista ? Color.blue : Color.green)
                    .padding(mensaje.senderName == vista ? .leading : .trailing)
                    .listRowInsets(EdgeInsets(top: 20, leading: mensaje.senderName == vista ? 40 : 5, bottom: 20, trailing: mensaje.senderName == vista ? 5 : 40))
                Divider()
            }
        }
        
        HStack {
            TextField("Escriba su mensaje", text: $field)
            Button("Enviar") {
                if (field != "") {
                    mensajes.messages.append(Message(id: UUID(), senderName: vista, content: field, timestamp: Date()))
                }
                field = "";
            }
        }
        .padding()
    }

}


struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChatView(vista: "Mari")
                .environmentObject(ChatModel())
        }
    }
}

/*#Preview {
    ChatView(vista: "Mari")
        .environmentObject(ChatModel())
}*/
