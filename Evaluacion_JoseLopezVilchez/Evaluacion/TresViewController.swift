//
//  TresViewController.swift
//  Evaluacion
//
//  Created by dam2 on 25/2/25.
//

import UIKit
import CoreData

class TresViewController : UITableViewController, Load {
    
    var contactos = [NSManagedObject]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return };
        
        let managedContext = appDelegate.persistentContainer.viewContext;
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Contacto");
        
        do {
            contactos = try managedContext.fetch(fetchRequest);
        } catch let error as NSError {
            print("No se ha podido obtener los datos: \(error), \(error.userInfo)");
        }
    }
    
    func load() {
        tableView.reloadData();
    }
    
}

extension TresViewController { //UITableViewDataSource - metodos
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactos.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell;

        //celda.texto.text = notas[indexPath.row].value(forKeyPath: "title") as? String;
        cell.nombre.text = contactos[indexPath.row].value(forKeyPath: "name") as? String;
        cell.correo.text = contactos[indexPath.row].value(forKeyPath: "mail") as? String;
        cell.telefono.text = contactos[indexPath.row].value(forKeyPath: "phone") as? String;
        
        return cell;
    }
}

extension TresViewController { // UITableViewDelegate - metodos
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Borrar") { (action, view, completionHandler) in
            
            let contacto = self.contactos[indexPath.row];
            
            let managedContext = contacto.managedObjectContext;
            
            managedContext?.delete(contacto);
            
            do {
                try managedContext?.save();
            } catch let error as NSError {
                print("No se ha podido eliminar el objeto: \(error), \(error.userInfo)")
            }
            
            self.contactos.remove(at: indexPath.item);
            tableView.reloadData();
            
            completionHandler(true);
        }
        
        deleteAction.backgroundColor = .systemRed;
        
        return UISwipeActionsConfiguration(actions: [deleteAction]);
        
    }
}


