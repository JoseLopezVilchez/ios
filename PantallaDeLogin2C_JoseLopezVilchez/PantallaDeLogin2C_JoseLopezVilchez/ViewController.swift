//
//  ViewController.swift
//  PantallaDeLogin2C_JoseLopezVilchez
//
//  Created by dam2 on 19/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var stackview: UIStackView!
    //@IBOutlet weak var stackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        if size.width > size.height {
            //Apaisado
            stackview.axis = .horizontal;
        } else {
            //Vertical
            stackview.axis = .vertical;
        }
    }

}

