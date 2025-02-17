//
//  LandmarkRow.swift
//  PruebaUI
//
//  Created by dam2 on 11/2/25.
//

import SwiftUI

struct LandmarkRow: View {
    
    var landmark : Landmark;
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name);
            Spacer();
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow);
            }
        };
    }
}

#Preview ("Turtle rock") {
    let landmarks = ModelData().landmarks;
    return Group {
        LandmarkRow(landmark: landmarks[0]);
    }
}
