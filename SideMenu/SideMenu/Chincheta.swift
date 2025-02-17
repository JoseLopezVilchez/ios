//
//  Chincheta.swift
//  SideMenu
//
//  Created by dam2 on 6/2/25.
//

import Foundation;
import MapKit;
import Contacts; //provee elementos que relacionan campos de direccion, ciudad, estado etc de una ubicacion

class Artwork : NSObject, MKAnnotation {
    
    let title : String?;
    let location : String;
    let discipline : String;
    var coordinate: CLLocationCoordinate2D;
    
    var subtitle : String? {
        return location;
    }
    
    init(title: String?, location: String, discipline: String, coordinate: CLLocationCoordinate2D) {
        self.title = title;
        self.location = location;
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
