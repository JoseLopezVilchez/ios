//
//  CharacterViewController.swift
//  CollectionViewConInformacionExterna_JoseLopezVilchez
//
//  Created by dam2 on 21/1/25.
//

import UIKit

class CharacterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var stack: UIStackView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var especie: UILabel!
    @IBOutlet weak var estado: UILabel!
    @IBOutlet weak var genero: UILabel!
    @IBOutlet weak var origen: UILabel!
    @IBOutlet weak var localizacion: UILabel!
    @IBOutlet weak var imagen: UIImageView!
    
    var instancia : PasoAtras?;
    
    lazy var datos : (
        nombre : String,
        especie : String,
        estado : String,
        genero : String,
        origen : String,
        localizacion : String,
        listado : [String],
        imagen : String
    ) = (nombre : "", especie : "", estado : "", genero : "", origen : "", localizacion : "", listado : [], imagen : "");
    
    override func viewDidLoad() {
        super.viewDidLoad();
        tableView.delegate = self;
        tableView.dataSource = self;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        datos.listado.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "episodio", for: indexPath) as! CeldaTexto;
        
        cell.texto.text = datos.listado[indexPath.item];
        
        return cell;
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        loadEpisode(from: datos.listado[indexPath.item], do: {
            loadCharacterArray(from: $0.characters, do: {
                self.instancia?.pasoAtras(datos: $0);
                self.dismiss(animated: true);
            });
        });
    }
    
    func rellenarInfo () {
        nombre.text = datos.nombre;
        especie.text = datos.especie;
        estado.text = datos.estado;
        genero.text = datos.genero;
        origen.text = datos.origen;
        localizacion.text = datos.localizacion;
        
        tableView.reloadData();
        
        if (datos.imagen != "") {
            loadImage(from: datos.imagen, completion: {
                self.imagen.image = $0;
            });
        }
    }
    
    /*func pasarListadoPersonajes () {
        
        loadCharacterArray(from: datos.listado, do: {
            self.instancia?.pasoAtras(datos: $0);
        });
        
    }*/
}

protocol PasoAtras {
    func pasoAtras (datos : [Character]);
}
