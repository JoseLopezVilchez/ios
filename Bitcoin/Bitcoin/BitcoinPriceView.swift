//
//  ContentView.swift
//  Bitcoin
//
//  Created by dam2 on 6/3/25.
//

import SwiftUI

extension Color {
    static let bitcoinGreen : Color = Color.green.opacity(0.9);
}

struct BitcoinPriceView: View {
    
    @ObservedObject var viewModel : BitcoinPriceViewModel;
    
    @State private var selectedCurrency : Currency = .eur;
    
    var body: some View {
        VStack {
            
            Text("Actualizado el \(viewModel.lastUpdated)")
                .padding([.top, .bottom])
                .foregroundStyle(Color.bitcoinGreen)
            
            TabView (selection: $selectedCurrency) {
                ForEach(viewModel.priceDetails.indices, id: \.self) { index in
                    let priceDetails = viewModel.priceDetails[index];
                    PriceDetailsView(priceDetails: priceDetails)
                        .tag(priceDetails.currency)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            
            VStack(spacing: 0) {
                HStack(alignment: .center) {
                    //Selector de moneda
                    Picker(selection: $selectedCurrency, label: Text("Currency")) {
                        Text("\(Currency.usd.icon) \(Currency.usd.code)").tag(Currency.usd)
                        Text("\(Currency.gbp.icon) \(Currency.gbp.code)").tag(Currency.gbp)
                        Text("\(Currency.eur.icon) \(Currency.eur.code)").tag(Currency.eur)
                    }
                    .padding(.leading)
                    .tint(Color.bitcoinGreen)
                    
                    Spacer()
                    
                    Button (action: viewModel.onAppear) {
                        Image(systemName: "arrow.clockwise")
                            .font(.largeTitle)
                    }
                    .padding(.trailing)
                    
                }
                .padding(.top)
            }
            .foregroundStyle(Color.bitcoinGreen)
        }
        .onAppear(perform: viewModel.onAppear)
        .pickerStyle(MenuPickerStyle())
    }
    
}

#Preview {
    BitcoinPriceView(viewModel: BitcoinPriceViewModel())
}
