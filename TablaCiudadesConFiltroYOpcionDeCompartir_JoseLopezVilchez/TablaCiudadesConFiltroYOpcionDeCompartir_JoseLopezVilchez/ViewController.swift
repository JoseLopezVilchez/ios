//
//  ViewController.swift
//  TablaCiudadesConFiltroYOpcionDeCompartir_JoseLopezVilchez
//
//  Created by dam2 on 17/12/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
    
    @IBOutlet weak var tabla: UITableView!
    
    let searchController = UISearchController();
    
    let listado : [(nombre : String, imagen : UIImage)] = [
        (nombre : "Linares", imagen : .linares),
        (nombre : "Málaga", imagen : .málaga),
        (nombre : "Granada", imagen : .granada),
        (nombre : "Barcelona", imagen : .barcelona),
        (nombre : "Madrid", imagen : .madrid)
    ];
    var ciudades : [(nombre : String, imagen : UIImage)] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabla.delegate = self;
        tabla.dataSource = self;
        
        ciudades = listado;
        
        searchController.searchResultsUpdater = self;
        navigationItem.searchController = searchController;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {return 1;}

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ciudades.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celda = tableView.dequeueReusableCell(withIdentifier: "Celda", for: indexPath) as! Celda;
        
        celda.imgV.image = ciudades[indexPath.item].imagen;
        celda.label.text = ciudades[indexPath.item].nombre;
        
        return celda;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let seleccion = ciudades[indexPath.item].nombre;
        searchController.searchBar.text = seleccion;
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let texto = searchController.searchBar.text else {
            return;
        }
        
        if (texto == "") {
            ciudades = listado;
        } else {
            ciudades.removeAll();
            ciudades = listado.filter({$0.nombre.hasPrefix(texto)});
        }
        
        tabla.reloadData();
        return;
        
    }
}
