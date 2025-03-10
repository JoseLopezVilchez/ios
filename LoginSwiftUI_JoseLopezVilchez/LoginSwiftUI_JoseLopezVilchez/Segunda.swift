//
//  Segunda.swift
//  LoginSwiftUI_JoseLopezVilchez
//
//  Created by dam2 on 6/3/25.
//

/*
 - un botón que muestra una vista en la mitad inferior de la pantalla que muestra el nombre de usuario

Esta segunda pantalla debe aparecer dentro de un TabBar
 */

import SwiftUI

struct Segunda: View {
    
    @AppStorage("usuario") var username = "user";
    
    var body: some View {

        TabView {
            
            Tab("Una", systemImage: "tray.and.arrow.down.fill") {
                Text(username)
            }

            Tab("Ajustes", systemImage: "tray.and.arrow.up.fill") {
                Ajustes()
            }
            
        }
    }
}

#Preview {
    Segunda()
}
