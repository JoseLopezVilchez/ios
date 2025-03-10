//
//  CheckoutView.swift
//  RestauranteUI
//
//  Created by dam2 on 20/2/25.
//

import SwiftUI

struct CheckoutView: View {
    
    @EnvironmentObject var order : Order;
    
    let paymentTypes = ["Efectivo", "Tarjeta de crédito", "Programa de puntos"];
    @State private var paymentType = "Efectivo";
    @State private var addLoyaltyDetails = false;
    @State private var loyaltyNumber = "";
    @State private var showingPaymentAlert = false;
    
    let tipAmounts = [10, 15, 20, 25, 0];
    @State private var tipAmount = 15;
    
    var body: some View {
        
        VStack {
            List {
                Section {
                    Picker ("Elegir forma de pago", selection: $paymentType) {
                        ForEach (paymentTypes, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    Toggle ("Tengo tarjeta de fidelización", isOn: $addLoyaltyDetails)
                    
                    if (addLoyaltyDetails) {
                        TextField ("Introduce tu número de tarjeta", text: $loyaltyNumber)
                    }
                }
                
                Section ("Dejar propina?") {
                    Picker ("Porcentaje", selection: $tipAmount) {
                        ForEach (tipAmounts, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section ("Total: \(order.getTotalPrice(propina: tipAmount))€") {
                    Button ("Confirmar pedido") {
                        showingPaymentAlert = true;
                    }
                }
            }
        }
        .navigationTitle("Pago")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Todo listo", isPresented: $showingPaymentAlert) {
            //Botones
            Button("Aceptar", role: .cancel) {
                showingPaymentAlert = false
                order.removeAll();
            }
        } message: {
            Text("Se ha realizado el pago. El importe ha sido de \(order.getTotalPrice(propina: tipAmount)). Gracias por su visita.")
        }
    }
}

#Preview {
    NavigationStack {
        CheckoutView()
            .environmentObject(Order())
    }
}
