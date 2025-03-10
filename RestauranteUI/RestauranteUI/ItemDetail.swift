//
//  ItemDetail.swift
//  RestauranteUI
//
//  Created by dam2 on 20/2/25.
//

import SwiftUI

struct ItemDetail: View {
    
    @EnvironmentObject var order : Order;
    
    @State private var showingAddToCartAlert = false;
    
    let item : MenuItem;
    
    var body: some View {
        VStack {
            ZStack (alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Autor: \(item.photoCredit)")
                    .padding(4)
                    .background(.black)
                    .font(.caption)
                    .foregroundStyle(.white)
                    .offset(x: -5, y: -5)
            }
            
            Text(item.description)
                .padding()
            
            Button ("Comprar") {
                order.add(item: item)
                showingAddToCartAlert = true;
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
        //añadimos modificador alert
        .alert("Producto añadido al carrito", isPresented: $showingAddToCartAlert) {
            //Botones
            Button("Aceptar", role: .cancel) {
                showingAddToCartAlert = false
            }
        } message: {
            Text("Se ha añadido un \(item.name)")
        }
    }
}

#Preview {
    NavigationStack {
        ItemDetail(item: MenuItem.example)
            .environmentObject(Order())
    }
}
