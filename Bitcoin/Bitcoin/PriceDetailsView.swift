//
//  PriceDetailView.swift
//  Bitcoin
//
//  Created by dam2 on 6/3/25.
//

import SwiftUI

struct PriceDetailsView: View {
    
    let priceDetails : PriceDetails;
    
    var body: some View {
        ZStack {
            Color.bitcoinGreen
            VStack {
                Text(priceDetails.currency.icon)
                    .font(.largeTitle)
                Text("1 bitcoin = ")
                    .bold()
                    .font(.title2)
                Text("\(priceDetails.rate) \(priceDetails.currency.code)")
                    .bold()
                    .font(.largeTitle)
            }
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    PriceDetailsView(priceDetails: PriceDetails(currency: .eur))
}
