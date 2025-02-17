//
//  MapaLinares.swift
//  SideMenu
//
//  Created by dam2 on 6/2/25.
//

/*
 - MAPA LINARES
9. Crear otra pantalla (a la que se accede desde el menú lateral izquierdo) con un mapa.
10. Representar la ubicación de "El Pósito" en el mapa.
11. Hacer que aparezca el mapa centrado con la ubicación de "El Pósito".
12. Implementar opción para que nos indique cómo llegar a la ubicación, utilizando la aplicación Mapas.
13. Representar la ubicación de la escuela en el mapa.
14. Hacer que al pulsar este accesorio nos lleve a https://escuelaestech.es
15. (Avanzado) Cambiar el aspecto del marcador de la escuela: utilizar el logo de EsTech.
16. (Avanzado) Cambiar el aspecto del marcador de "El Pósito": color amarillo.
*/


import UIKit;
import MapKit;

class MapaLinares: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapa: MKMapView!;
    
    let lugar = CLLocation(latitude: 38.0858, longitude: -3.63120974);
    let regionRadius : CLLocationDistance = 1000; //En metros
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        centerMapOnLocation(location: lugar);
        
        chinchetas();
        
        mapa.delegate = self;
    }
    
    func centerMapOnLocation (location : CLLocation) {
        mapa.setRegion(
            MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius),
            animated: true
        );
    }
    
    func chinchetas () {
        let artwork = Artwork(title: "Mono con Capa", locationName: "Ethereum", discipline: "ETF", coordinate: inicial.coordinate);
        mapa.addAnnotation(artwork);
        mapa.addAnnotation(Artwork(title: "Mad Lads", locationName: "Solana", discipline: "SOL", coordinate: segundoLugar.coordinate));
    }
    
    //esto es como el cellForRowAt, se ejecuta siempre que se añade un annotation
    func mapView(_ mapView: MKMapView, viewFor annotation: any MKAnnotation) -> MKAnnotationView? {
        
        guard let annotation = annotation as? Artwork else { return nil };
        
        //creo vista como mkmarkerannotationview para que aparezcan marcadores
        let identifier = "marker";
        var view : MKMarkerAnnotationView;
        
        //los annotation se reciclan como las celdas, por ll que hay que comprobar si se puede reutilizar alguno
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation;
            view = dequeuedView;
        } else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier);
            view.canShowCallout = true;
            view.calloutOffset = CGPoint(x: -5, y: -5);
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure);
        }
        
        return view;
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) { //Se ejecuta al hacer click en la chincheta, en el iconito de dentro
        
        let location = view.annotation as! Artwork;
        let lauchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeKey];
        location.mapItem().openInMaps(launchOptions: lauchOptions); // esto da una ruta para llegar a un sitio
        
    }

}
