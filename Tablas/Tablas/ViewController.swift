//
//  ViewController.swift
//  Tablas
//
//  Created by mac-profesor on 10/12/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let colores: [UIColor] = [.red, .blue, .green, .yellow, .orange, .brown, .cyan, .magenta, .lightGray]
     

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var protoId = ""
        if indexPath.item % 2 == 1 {
            protoId = "proto1"
        }else{
            protoId = "proto2"
        }
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: protoId, for: indexPath) as! Proto1TableViewCell
        cell.backgroundColor = colores[indexPath.item]
        cell.label.text = colores[indexPath.item].accessibilityName
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let colorDeLaCelda = colores[indexPath.item]
        print("Has pulsado la celda de color \(colorDeLaCelda.accessibilityName)")
        
        //Obtener la instancia del VC
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "detalleView") as! DetalleViewController
        //Personalizar las propiedades de vc
        vc.texto = colorDeLaCelda.accessibilityName
        vc.navigationItem.title = colorDeLaCelda.accessibilityName
        vc.view.backgroundColor = colorDeLaCelda
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        //Creamos la acción
        let deleteAction = UIContextualAction(style: .destructive, title: "Eliminar"){ (action, sourceView, completionHandler) in
            
            print("Se ha pulsado el botón de eliminar de la celda \(self.colores[indexPath.item].accessibilityName)")
            
        }
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])
        
        swipeConfiguration.performsFirstActionWithFullSwipe = false
        
        return swipeConfiguration
        
    }

}

