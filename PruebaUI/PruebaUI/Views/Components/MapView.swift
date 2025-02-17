//
//  MapView.swift
//  PruebaUI
//
//  Created by dam2 on 11/2/25.
//

import SwiftUI
import MapKit

@available(iOS 17.0, *)
struct MapView: View {
    
    var coordinate : CLLocationCoordinate2D;
    
    var body: some View {
        Map(position : .constant(.region(region))); //.constant hace que no cambie el valor, pues normalmente observaría el valor position
    }
    
    private var region : MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

#Preview {
    if #available(iOS 17.0, *) {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 38.094241, longitude: -3.63245));
    } else {
        Text("Mapa no disponible, debe actualizar a la version de iOS 17 o posterior")
    }
}
