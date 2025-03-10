//
//  Login.swift
//  LoginSwiftUI_JoseLopezVilchez
//
//  Created by dam2 on 6/3/25.
//

/*
 Utiliza el ejercicio anterior donde diseñaste una pantalla de login con SwiftUI.

 Sólo se podrá acceder con el usuario "user" y la contraseña "pass"

 Deberá mostrar una alerta cuando algún campo esté vacío o la contraseña tenga menos de 4 caracteres
 */

import SwiftUI

struct Login : View {
    
    @AppStorage("usuario") var username = "user";
    @AppStorage("pass") var password = "pass";
    @AppStorage("recordar") var recordar : Bool = true;
    
    @EnvironmentObject var data : Data;
    
    @State var usuario : String = "";
    @State var pass : String = "";
    @State var showAlert : (Bool, Bool) = (false, false);
    
    var body: some View {
        
        ZStack {
            
            Circle()
                .fill(Color.white.opacity(0.5))
                .frame(width: 700)
            
            Circle()
                .fill(Color.white)
                .frame(width: 500)
            
            VStack {
                
                Text("Iniciar sesión")
                    .font(.largeTitle)
                    .bold()
                
                TextField("Nombre de usuario", text: $usuario)
                    .frame(width: 300, height: 60)
                    .padding(.leading)
                    .background {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.secondary, lineWidth: 0.3)
                            .fill(Color.secondary.opacity(0.3))
                    }
                    .alert(isPresented: $showAlert.0) {
                        Alert(title: Text("Error"), message: Text("El nombre de usuario es incorrecto"), dismissButton: .default(Text("OK")))
                    }
                    .autocapitalization(.none)
                
                SecureField("Contraseña", text: $pass)
                    .frame(width: 300, height: 60)
                    .padding(.leading)
                    .background {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.secondary, lineWidth: 0.3)
                            .fill(Color.secondary.opacity(0.3))
                    }
                    .padding()
                    .alert(isPresented: $showAlert.1) {
                        Alert(title: Text("Error"), message: Text("La contraseña es incorrecta"), dismissButton: .default(Text("OK")))
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
                    
                    if usuario != username || usuario.count < 4 {
                        showAlert.0 = true
                    } else if pass != password || pass.count < 4 {
                        showAlert.1 = true
                    } else {
                        data.login = false
                    }
                    
                } label: {
                    Text("Login")
                        .frame(width: 120, height: 50)
                }
                .buttonStyle(.borderedProminent)
                .tint(Color.teal)
                
                HStack {
                    Spacer()
                    Button ("Recuperar contraseña") {
                        
                    }
                    .tint(Color.teal)
                }
                .padding()

            }
            .frame(width: 300, height: 600)
            .padding()
                
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.teal)
    }
}

#Preview {
    Login()
        .environmentObject(Data())
}
