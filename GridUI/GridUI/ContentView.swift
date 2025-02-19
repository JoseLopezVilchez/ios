//
//  ContentView.swift
//  GridUI
//
//  Created by dam2 on 18/2/25.
//

import SwiftUI

struct ContentView: View {
    
    @Binding var isPresented : Bool;
    
    let columns = [
        GridItem(.flexible(minimum: 90), spacing: 20),
        GridItem(.flexible(minimum: 90), spacing: 20),
        GridItem(.flexible(minimum: 90), spacing: 20)
    ]
    
    let devices = DeviceRepository.all;
    
    var body: some View {
        
        /*LazyVGrid(columns: [
            GridItem(.fixed(10), spacing: 20), //columnas de tamaño fijo
            GridItem(.flexible(minimum: 10, maximum: 10), spacing: 20), //columnas de tamaño variable
            GridItem(.adaptive(minimum: 10, maximum: 10), spacing: 20) //estas columnas añaden columnas extra si el espacio lo permite, y si hubiese múltiples se reparten el espacio
        ], spacing: 20) {
            Text("Texto 1")
            Text("Texto 2")
            Text("Texto 3")
        }*/
        
        VStack {
            NavigationView {
                //ScrollView (.horizontal) {
                ScrollView (.vertical) {
                    //LazyHGrid(rows: columns, spacing: 20) {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(devices, content: DeviceItem.init)
                    }
                    .padding(.all, 50)
                    .navigationTitle("Dispositivos Apple")
                    .toolbarTitleDisplayMode(.inline)
                }
            }
        }
        
        Button ("Cerrar") {
            isPresented = false
        }
        
        
        
    }
}

#Preview {
    ContentView(isPresented: .constant(false))
}
