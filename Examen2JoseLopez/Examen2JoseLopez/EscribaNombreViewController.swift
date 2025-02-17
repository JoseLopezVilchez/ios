//
//  EscribaNombreViewController.swift
//  Examen2JoseLopez
//
//  Created by dam2 on 5/12/24.
//

import UIKit

class EscribaNombreViewController: UIViewController {
    
    @IBOutlet weak var textInput: UITextField!;
    
    let storyBoard = UIStoryboard(name: "Main", bundle: nil);
    
    lazy var pantallaBienvenida: BienvenidoViewController = {
        return storyBoard.instantiateViewController(withIdentifier: "pantallaBienvenida") as! BienvenidoViewController
    }();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        
    }
    
    @IBAction func enviar(_ sender: Any) {
        
        pantallaBienvenida.checkNombre(nombre: textInput.text ?? "");
        
        self.navigationController?.pushViewController(pantallaBienvenida, animated: true)
        
    }
    
}
