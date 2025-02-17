//
//  LandmarkDetail.swift
//  PruebaUI
//
//  Created by dam2 on 13/2/25.
//

import SwiftUI

struct LandmarkDetail: View {
    
    @Environment(ModelData.self) var modelData;
    
    var landmark : Landmark;
    
    var landmarkIndex : Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!;
    }
    
    var body: some View {
        
        @Bindable var modelData = modelData;
        
        ScrollView {
            VStack {
                if #available(iOS 17.0, *) {
                    MapView(coordinate: landmark.locationCoordinate)
                        .frame(height: 300)
                }
                CircleImage(image: landmark.image)
                    .offset(y: -100)
                    .padding(.bottom, -100)
                VStack (alignment: .leading) {
                    Text(landmark.name)
                        .font(.title)
                        .foregroundStyle(.black)
                        .bold()
                    HStack {
                        Text(landmark.state)
                            .font(.subheadline)
                        Spacer()
                        FavButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                    }
                    Divider()
                    Text("Sobre el parque de \(landmark.name)")
                        .font(.title2)
                        .bold()
                    Text(landmark.description)
                }
                .padding()
                Spacer()
            }
        }
    }
}

#Preview {
    let modelData = ModelData();
    LandmarkDetail(landmark: modelData.landmarks[0])
        .environment(modelData);
}
