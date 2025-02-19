//
//  Bienvenida.swift
//  GridUI
//
//  Created by dam2 on 18/2/25.
//

import SwiftUI

struct Bienvenida: View {
    
    @State private var isPresented : Bool = false;
    
    var body: some View {
        VStack {
            Button ("Abrir") {
                isPresented = true
            }
        }
        .sheet(isPresented: $isPresented, onDismiss: {
        //.fullScreenCover(isPresented: $isPresented, onDismiss: {
            isPresented = false
        }, content: {
            ContentView(isPresented: $isPresented)
            /*VStack {
                Button ("Cerrar") {
                    isPresented = false
                }
            }*/
            //.presentationDetents([.medium])
            //.presentationDetents([.fraction(0.3)])
            .presentationDetents([.fraction(0.3), .medium, .large])
        })
        
    }
}

#Preview {
    Bienvenida()
}
