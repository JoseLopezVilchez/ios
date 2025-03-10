//
//  Formulario.swift
//  LoginSwiftUI_JoseLopezVilchez
//
//  Created by dam2 on 6/3/25.
//

/*
 Añadir al TabBar otro botón que muestre la vista de ajustes con un formulario que contiene los siguientes elementos:
  - Nombre de usuario
  - Permite cambiar el nombre de usuario
  - Switch para recordar la contraseña, que refleja y permite cambiar el valor seleccionado por el usuario en la pantalla de login
  - Opción para cambiar la contraseña
  - El nombre de usuario y contraseña se debe almacenar en UserDefaults, para que se mantengan los cambios tras cerrar la aplicación.
 */

import SwiftUI

struct Ajustes: View {
    
    @AppStorage("usuario") var username = "user";
    @AppStorage("pass") var password = "pass";
    @AppStorage("recordar") var recordar : Bool = true;
    
    @State var usuario : String = "";
    @State var pass : (String, String) = ("", "");
    @State var showAlert : (Bool, Bool, Bool, Bool) = (false, false, false, false);
    
    var body: some View {
        
        VStack {
            
            Text(username)
            TextField("Nombre de usuario", text: $usuario)
                .frame(width: 300, height: 40)
                .padding(.leading)
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.secondary, lineWidth: 0.3)
                        .fill(Color.secondary.opacity(0.3))
                }
                .alert(isPresented: $showAlert.0) {
                    Alert(title: Text("Error"), message: Text("El nombre de usuario es demasiado corto"), dismissButton: .default(Text("OK")))
                }
                .autocapitalization(.none)
            
            Text(password)
            SecureField("Contraseña", text: $pass.0)
                .frame(width: 300, height: 40)
                .padding(.leading)
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.secondary, lineWidth: 0.3)
                        .fill(Color.secondary.opacity(0.3))
                }
                .alert(isPresented: $showAlert.1) {
                    Alert(title: Text("Error"), message: Text("La contraseña es demasiado corta"), dismissButton: .default(Text("OK")))
                }
                .autocapitalization(.none)
            
            SecureField("Repita ontraseña", text: $pass.1)
                .frame(width: 300, height: 40)
                .padding(.leading)
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.secondary, lineWidth: 0.3)
                        .fill(Color.secondary.opacity(0.3))
                }
                .alert(isPresented: $showAlert.1) {
                    Alert(title: Text("Error"), message: Text("La contraseña no coincide con la repetición"), dismissButton: .default(Text("OK")))
                }
                .autocapitalization(.none)
            
            
            HStack {
                Toggle ("", isOn: $recordar)
                    .labelsHidden()
                    .tint(Color.teal)
                Text("Recordar contraseña")
                Spacer()
            }
            
            Button {
                
                if usuario.count < 4 {
                    showAlert.0 = true
                } else if pass.0.count < 4 {
                    showAlert.1 = true
                } else if pass.0 != pass.1 {
                    showAlert.2 = true
                }
                else {
                    username = usuario
                    password = pass.0
                    showAlert.3 = true
                }
                
            } label: {
                Text("Cambiar")
                    .frame(width: 120, height: 30)
            }
            .buttonStyle(.borderedProminent)
            .tint(Color.teal)
            .alert(isPresented: $showAlert.3) {
                Alert(title: Text("Todo listo"), message: Text("Sus datos han sido cambiados"), dismissButton: .default(Text("OK")))
            }
            
        }
        .frame(width: 300)
        .padding()
        
        
        
    }
}

#Preview {
    Ajustes()
}
