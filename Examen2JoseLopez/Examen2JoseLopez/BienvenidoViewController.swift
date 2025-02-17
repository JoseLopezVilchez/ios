//
//  BienvenidoViewController.swift
//  Examen2JoseLopez
//
//  Created by dam2 on 5/12/24.
//

import UIKit

class BienvenidoViewController: UIViewController {
    
    @IBOutlet weak var botonConectar: UIButton!
    @IBOutlet weak var bienvenida: UILabel!
    
    var inicializado = false;
    var nombre = "";
    
    override func viewDidLoad() {
        super.viewDidLoad();
        inicializado = true;
        bienvenida.text = "Bienvenido \(nombre)";
    }
    
    func checkNombre (nombre : String) {
        self.nombre = nombre;
        
        if (inicializado && bienvenida.text != "Bienvenido \(self.nombre)") {
            bienvenida.text = "Bienvenido \(self.nombre)";
        }
    }
    
    @IBAction func alerta(_ sender: Any) {
        
        let pantallaAlerta : UIAlertController = UIAlertController(
            title: "Hola \(nombre)",
            message: "Se ha producido un error al establecer la conexión",
            preferredStyle: UIAlertController.Style.alert
        );
        
        pantallaAlerta.addAction(UIAlertAction(
            
            title: "Aceptar",
            style: .default,
            handler: { (action) in
                self.botonConectar.isEnabled = false;
                self.botonConectar.setTitle("Sin conexión", for: .disabled);
            }
            
        ));
        pantallaAlerta.addAction(UIAlertAction(
            
            title: "Cancelar",
            style: .cancel

        ));
        
        self.present(pantallaAlerta, animated: true);
        
    }
}
