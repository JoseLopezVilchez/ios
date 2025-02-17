//
//  PantallaBotonViewController.swift
//  PantallaDeLogin2C_JoseLopezVilchez
//
//  Created by dam2 on 2/12/24.
//

import UIKit

protocol TriggerDelegate {
    func deshabilitar();
}

class PantallaBotonViewController: UIViewController {
    
    @IBOutlet weak var boton: UIButton!
    @IBOutlet weak var label: UILabel!
    
    var delegate: TriggerDelegate?
    
    var pass = "";
    var usuario = "";
    var curso = "";
    var cargada = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cargada = true;
        boton.setTitle(usuario, for: .normal);
        cursoChecker();
    }
    
    func cursoChecker () {
        if (cargada && label.text != curso) {
            label.text = "Soy alumno de \(curso)";
        }
    }
    
    @IBAction func cambioPantalla(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil) //Instancia del Storyboard 'Main' (mismo nombre que el archivo)
        let pantallaLabel = storyBoard.instantiateViewController(withIdentifier: "pantallaLabel") as! PantallaLabelViewController //Instancia del ViewController 'personalizado'
        
        pantallaLabel.pass = pass;
        
        //Presentamos el nuevo VC
        self.navigationController?.pushViewController(pantallaLabel, animated: true)
    }
}
