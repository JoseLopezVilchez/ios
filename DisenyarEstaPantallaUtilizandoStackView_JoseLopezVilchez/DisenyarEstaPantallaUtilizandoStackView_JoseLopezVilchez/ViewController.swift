//
//  ViewController.swift
//  DisenyarEstaPantallaUtilizandoStackView_JoseLopezVilchez
//
//  Created by dam2 on 21/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var abuelo: UIStackView!
    
    @IBOutlet weak var padre: UIStackView!
    
    @IBOutlet weak var hijoA: UIStackView!
    @IBOutlet weak var hijoB: UIStackView!
    @IBOutlet weak var hijoC: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        coordinator.animate(alongsideTransition: { _ in
            if size.width > size.height {
                //apaisado
                self.abuelo.axis = .horizontal;
                
                self.padre.axis = .vertical;
                
                self.hijoA.axis = .vertical;
                
                self.hijoB.axis = .vertical;
                
                self.hijoC.axis = .vertical;
                
            } else {
                //vertical
                self.abuelo.axis = .vertical;
                
                self.padre.axis = .horizontal;
                
                self.hijoA.axis = .horizontal;
                
                self.hijoB.axis = .horizontal;
                
                self.hijoC.axis = .horizontal;
                
            }
        })
    }
}

