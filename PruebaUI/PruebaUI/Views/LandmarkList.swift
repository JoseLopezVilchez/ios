//
//  LandmarkList.swift
//  PruebaUI
//
//  Created by dam2 on 13/2/25.
//

import SwiftUI

struct LandmarkList: View {
    
    @Environment(ModelData.self) var modelData;
    @State private var showFavoritesOnly = false;
    
    var filteredLandmarks : [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    };
    
    var body: some View {
        
        NavigationSplitView {
            List {
                Toggle("Filtrar por favoritos", isOn: $showFavoritesOnly);
                ForEach (filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark);
                    }
                    label : {
                        LandmarkRow(landmark: landmark);
                    };
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Parques naturales");
        } detail: {
            Text("Selecciona un landmark");
        }
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
