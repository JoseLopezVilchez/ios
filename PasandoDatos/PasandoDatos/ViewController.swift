//
//  ViewController.swift
//  PasandoDatos
//
//  Created by mac-profesor on 26/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var miLabel: UILabel!
    @IBOutlet weak var miTextField: UITextField!
    @IBOutlet weak var miBoton: UIButton!
    @IBOutlet weak var boton2: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        miLabel.text = "Escribe tu nombre"
        miBoton.setTitle("Enviar", for: .normal)
        
    }
    
    
    
    @IBAction func boton2Action(_ sender: Any) {
        if let texto = miTextField.text, texto != "" {
            //Instanciar storyboard
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            //Instanciar el VC
            let vc = storyBoard.instantiateViewController(withIdentifier: "pantallaDos") as! PantallaDosViewController
            //Modificamos las propiedades
            vc.nombre = miTextField.text ?? "Nombre desconocido"
            //Presentamos el nuevo VC
            self.present(vc, animated: true)
        }
    }
    
    
    @IBAction func conVCAction(_ sender: Any) {
        if let texto = miTextField.text, texto != "" {
            //Instanciar storyboard
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            //Instanciar el VC
            let vc = storyBoard.instantiateViewController(withIdentifier: "pantallaDos") as! PantallaDosViewController
            //Modificamos las propiedades
            vc.nombre = miTextField.text ?? "Nombre desconocido"
            //Presentamos el nuevo VC a través del Navigation Controller
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "showPantallaDosVC" {
            if let texto = miTextField.text, texto != "" {
                return true
            }else{
                return false
            }
        }
        
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "showPantallaDosVC"{
            let vc = segue.destination as! PantallaDosViewController
            vc.nombre = miTextField.text ?? "Nombre desconocido"
        }
        
    }
    
    
    


}

