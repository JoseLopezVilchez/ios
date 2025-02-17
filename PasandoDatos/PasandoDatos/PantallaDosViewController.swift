//
//  PantallaDosViewController.swift
//  PasandoDatos
//
//  Created by mac-profesor on 26/11/24.
//

import UIKit

class PantallaDosViewController: UIViewController {
    
    @IBOutlet weak var nombreLabel: UILabel!
    
    var nombre = "Nombre provisional"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nombreLabel.text = nombre
        
    }
    
}
