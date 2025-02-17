//
//  PantallaLabelViewController.swift
//  PantallaDeLogin2C_JoseLopezVilchez
//
//  Created by dam2 on 2/12/24.
//

import UIKit

class PantallaLabelViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    var pass = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = pass;
    }
    
}
