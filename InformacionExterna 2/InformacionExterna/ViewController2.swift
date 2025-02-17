//
//  ViewController2.swift
//  InformacionExterna
//
//  Created by mac-profesor on 4/12/24.
//

import UIKit


class ViewController2: UIViewController {
        
    var delegate: PasarDatosPatras?

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func datosEnTF(_ sender: UITextField) {
        
        delegate?.recibirDatos(sender.text!)
        
    }
    

}
