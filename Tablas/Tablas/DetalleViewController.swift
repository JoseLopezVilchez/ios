//
//  DetalleViewController.swift
//  Tablas
//
//  Created by mac-profesor on 10/12/24.
//

import UIKit

class DetalleViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var texto = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = texto
    }
    


}
