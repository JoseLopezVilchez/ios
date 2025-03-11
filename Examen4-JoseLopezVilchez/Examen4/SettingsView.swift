//
//  SettingsView.swift
//  Examen4
//
//  Created by Alfonso Marín on 14/3/24.
//

import SwiftUI

struct SettingsView: View {
    
    @State var color : Color = .blue;
    @State var fecha : Date = Date();

    var body: some View {
        
        NavigationStack{
            
            
            
            List {
                HStack {
                    Text("Color de fondo de la pantalla principal")
                    Spacer()
                    ColorPicker("", selection: $color)
                }
                
                HStack {
                    Text("Selecciona el día del examen")
                    Spacer()
                    DatePicker("", selection: $fecha, displayedComponents: .date)
                        .datePickerStyle(.compact)
                }
            }
            .listStyle(.insetGrouped)
            .foregroundStyle(.gray)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Ajustes")
                        .bold()
                }
            }
        }
        
    }
}

#Preview {
    SettingsView()
}
