//
//  Artwork.swift
//  Mapas
//
//  Created by dam2 on 23/1/25.
//

import Foundation;
import MapKit;
import Contacts; //provee elementos que relacionan campos de direccion, ciudad, estado etc de una ubicacion

class Artwork : NSObject, MKAnnotation {
    
    let title : String?;
    let locationName : String;
    let discipline : String;
    var coordinate: CLLocationCoordinate2D;
    
    var subtitle : String? {
        return locationName;
    }
    
    init(title: String?, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
        self.title = title;
        self.locationName = locationName;
        self.discipline = discipline;
        self.coordinate = coordinate;
    }
    
    func mapItem() -> MKMapItem { //Esto usa Contacts
        let addressDict = [CNPostalAddressStreetKey : subtitle!];
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDict);
        let mapItem = MKMapItem(placemark: placemark);
        mapItem.name = title;
        
        return mapItem;
    }
}
