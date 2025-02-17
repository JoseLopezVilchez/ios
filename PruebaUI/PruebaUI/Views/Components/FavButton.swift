//
//  FavButton.swift
//  PruebaUI
//
//  Created by dam2 on 13/2/25.
//

import SwiftUI

struct FavButton: View {
    
    @Binding var isSet : Bool;
    
    var body: some View {
        Button {
            isSet.toggle();
        } label : {
            Label("Favorito", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .yellow : .gray);
        }
    }
}

#Preview {
    FavButton(isSet: .constant(true));
}
