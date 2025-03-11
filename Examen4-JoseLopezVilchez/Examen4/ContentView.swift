//
//  ContentView.swift
//  Examen4
//
//  Created by Alfonso Marín on 13/3/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var mensajes : ChatModel = ChatModel();
    //@EnvironmentObject var mensajes : ChatModel;
    @State var mostrarOpciones : Bool = false;
    
    let opciones = ["Paco", "Mari"];

    var body: some View {
        
        NavigationStack{
            List {
                ForEach (opciones, id: \.self) { item in
                    NavigationLink(value: item) {
                        Text("Chat visto como \(item)")
                    }
                    
                }
            }
            .listStyle(.insetGrouped)
            .navigationDestination(for: String.self) { item in
                ChatView(vista: item)
                    .environmentObject(mensajes)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Examen 14 de Marzo de 2024")
                        .bold()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        mostrarOpciones = true;
                    } label: {
                        Image(systemName: "gear")
                    }
                    .labelsHidden()
                    .buttonStyle(.plain)
                }
            }
            .sheet(isPresented: $mostrarOpciones) {
                SettingsView()
                    .presentationDetents([.medium])
            }
        }
        
    }
    
}

#Preview {
    ContentView()
        .environmentObject(ChatModel())
}
