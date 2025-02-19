//
//  ItemRow.swift
//  RestauranteUI
//
//  Created by dam2 on 18/2/25.
//

import SwiftUI

struct ItemRow: View {
    
    let item : MenuItem;
    let colors : [String : Color] = [
        "D" : .purple,
        "G" : .black,
        "N" : .red,
        "S" : .blue,
        "V" : .green
    ];
    
    var body: some View {
        HStack {
            Image(item.thumbnailImage)
                .clipShape(.circle)
                .overlay(Circle().stroke(.gray, lineWidth: 2))
            
            VStack (alignment: .leading) {
                Text(item.name)
                    .bold()
                    .font(.headline)
                Text("\(item.price)€")
            }
            Spacer()
            ForEach (item.restrictions, id : \.self) { restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding(5)
                    .background(colors[restriction, default: .black])
                    .clipShape(.circle)
                    .foregroundStyle(.white)
            }
            
        }
    }
}

#Preview {
    ItemRow(item: MenuItem.example)
}
