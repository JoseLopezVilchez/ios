//
//  ViewController.swift
//  Mapas
//
//  Created by dam2 on 23/1/25.
//

import UIKit;
import MapKit;

class ViewController: UIViewController {

    @IBOutlet weak var mapa: MKMapView!;
    
    let inicial = CLLocation(latitude: 38.0858, longitude: -3.63120974);
    let segundoLugar = CLLocation(latitude: 38.0984464077, longitude: -3.2);
    let regionRadius : CLLocationDistance = 1000; //En metros
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        centerMapOnLocation(location: inicial);
        
        chinchetas();
        
        mapa.delegate = self;
    }
    
    func centerMapOnLocation (location : CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius);
        mapa.setRegion(coordinateRegion, animated: true);
    }
    
    func chinchetas () {
        let artwork = Artwork(title: "Mono con Capa", locationName: "Ethereum", discipline: "ETF", coordinate: inicial.coordinate);
        mapa.addAnnotation(artwork);
        mapa.addAnnotation(Artwork(title: "Mad Lads", locationName: "Solana", discipline: "SOL", coordinate: segundoLugar.coordinate));
    }
}

extension ViewController : MKMapViewDelegate {
    
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
