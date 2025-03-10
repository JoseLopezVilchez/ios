//
//  Principal.swift
//  LoginSwiftUI_JoseLopezVilchez
//
//  Created by dam2 on 6/3/25.
//

/*
 Al introducir el nombre de usuario y contraseña correctos y pulsar el botón "Login" se mostrará una pantalla con los siguientes elementos:
  - una imagen,
 
 Cada vista deberá tener configurada su correspondiente vista previa
*/

import SwiftUI

struct Principal: View {
    
    @State var mostrar : Bool = false;
    
    var body: some View {
        
        VStack {
            Image("chilkoottrail")
            
            Button("Muestra nombre") {
                mostrar = true;
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
            
            if mostrar {
                
            }
        }
        .sheet(isPresented: $mostrar) {
            Segunda()
                .presentationDetents([.medium])
        }
        
    }
}

#Preview {
    Principal()
}
