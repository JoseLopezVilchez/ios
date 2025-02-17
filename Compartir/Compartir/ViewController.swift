//
//  ViewController.swift
//  Compartir
//
//  Created by dam2 on 14/1/25.
//

import UIKit

class ViewController: UIViewController {
    
    //UIActivityViewController
    @IBOutlet weak var boton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func compartir(_ sender: Any) {
        
        let texto = "Bajate la aplicacion de Catan de dados";
        let url = URL(string: "https://escuelaestech.es")!;
        let imagen = UIImage(named: "blah")!;
        
        let arrayCompartir : [Any] = [texto, url, imagen];
        let activityViewController = UIActivityViewController(activityItems: arrayCompartir, applicationActivities: nil);
        
        if let vistaOrigen = activityViewController.popoverPresentationController{ //esta parte haria que funcionase en tablets, y determina un origen (del que sale el globito)
            vistaOrigen.sourceView = sender as! UIButton;
            //para cuando tenemos el boton de compartir en la barra de navegacion
            vistaOrigen.barButtonItem = sender as? UIBarButtonItem;
        }
        
        self.present(activityViewController, animated: true);
    }
    
    //URL Schemes
    
}

