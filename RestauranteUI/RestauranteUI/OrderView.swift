//
//  OrderView.swift
//  RestauranteUI
//
//  Created by dam2 on 20/2/25.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order : Order;
    
    var body: some View {
        
        NavigationStack {
            List {
                //Listado de MenuItem del Order
                Section {
                    ForEach (order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("\(item.price)")
                        }
                    }
                    .onDelete(perform: order.deleteItems)
                }
                
                Section {
                    NavigationLink ("Hacer pedido") {
                        CheckoutView()
                    }
                }
                //deshabilitamos seccion cuando no hay nada pedido
                .disabled(order.items.isEmpty)
            }
            .navigationTitle("Pedido")
            .toolbar {
                if (!order.items.isEmpty) {
                    EditButton()
                        //.disabled(order.items.isEmpty)
                }
            }
        }
        
    }
}

#Preview {
    OrderView()
        .environmentObject(Order())
}
