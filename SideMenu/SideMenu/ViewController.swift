//
//  ViewController.swift
//  SideMenu
//
//  Created by mac-profesor on 21/1/25.
//

/*
 1. Desarrollar una aplicación en Swift con menú lateral a la izquierda.
            
             - PANTALLA DE BIENVENIDA
 2. Crear una pantalla de bienvenida (home). Al menos deberá contener 1 UILabel y 1 UIImageView con los constraints suficientes para adaptarse a los diferentes tamaños de pantalla. Se debe poder acceder a esta pantalla mediante una de las opciones del menú izquierdo
            
             - MAPA TURISMO
 17. Añadir otra pantalla con un mapa, en la que se muestran los mismos elementos que en la anterior.
 18. Añadir un marcador con la ubicación de la Catedral de Baeza y hacer que al abrir la aplicación aparezcan los 3 marcadores en la pantalla del teléfono.
 19. Añadir un switch para ocultar/mostrar los elementos de fuera de Linares.
 20. (Avanzado) Permitir al usuario añadir nuevos markers de lugares de interés a este mapa
 21. (Avanzado) Permitir al usuario añadir nuevos markers con su ubicación en ese instante
*/

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureSideMenus(btnIzq: menuButton, btnDer: nil)
    }
}

extension UIViewController{
    func configureSideMenus(btnIzq: UIBarButtonItem, btnDer: UIBarButtonItem?){
        if revealViewController() != nil {
            //Botón izquierdo
            btnIzq.target = revealViewController()
            btnIzq.action = #selector(SWRevealViewController.revealToggle(_:))
            if let btnDer = btnDer {
                //Botón derecho
                btnDer.target = revealViewController()
                btnDer.action = #selector(SWRevealViewController.rightRevealToggle(_:))
            }
            
            //Tamaño de los menús
            revealViewController().rearViewRevealWidth = 276
            revealViewController().rightViewRevealWidth = 160
            
            //Añadir gesto para mostrar y ocultar el menú
            view.addGestureRecognizer((self.revealViewController().panGestureRecognizer()))
            
        }
    }
}
