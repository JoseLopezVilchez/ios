//
//  ViewController.swift
//  Ubicacion
//
//  Created by dam2 on 30/1/25.
//

import UIKit;

import CoreLocation;

class ViewController: UIViewController {
    
    var locationManager : CLLocationManager?;

    override func viewDidLoad() {
        super.viewDidLoad();
        
        locationManager = CLLocationManager();
        locationManager?.delegate = self;
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        locationManager?.stopUpdatingLocation();
    }
    
    
    @IBAction func obtenerUbicacion(_ sender: Any) {
        locationManager?.requestLocation();
    }
    
    @IBAction func obtenerPermisos(_ sender: Any) {
        locationManager?.requestWhenInUseAuthorization();
    }
    
    func requestLocation () {
        locationManager?.requestLocation();
    }
    
    func requestLocationUpdate () {
        locationManager?.startUpdatingLocation();
    }
    
    func stopLocationUpdate () {
        locationManager?.stopUpdatingLocation();
    }
    
}

extension ViewController : CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .notDetermined:
            print("El usuario aun no ha decidido");
            locationManager?.requestAlwaysAuthorization();
        case .restricted:
            print("Restringido por control parental");
        case .denied:
            print("El usuario ha rechazado el permiso");
            locationManager?.requestWhenInUseAuthorization();
        case .authorizedWhenInUse:
            print("El usuario ha permitido usar la ubicacion mientras se usa la aplicacion");
            locationManager?.requestAlwaysAuthorization();
        case .authorizedAlways:
            print("El usuario ha permitido usar la ubicacion siempre");
            self.requestLocationUpdate();
        default:
            print("Caso por defecto");
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return };
        
        print("Latitud: \(location.coordinate.latitude), longitud: \(location.coordinate.longitude) (\(location.horizontalAccuracy))");
        
        //detener la actualizacion de ubicaciones cuando obtengamos la precision deseada
        if (location.horizontalAccuracy < 10) {
            self.stopLocationUpdate();
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("Se ha producido un error: \(error.localizedDescription)");
    }
}
