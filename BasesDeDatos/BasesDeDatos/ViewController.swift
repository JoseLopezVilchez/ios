//
//  ViewController.swift
//  BasesDeDatos
//
//  Created by dam2 on 30/1/25.
//

import UIKit;
import CoreData;

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!;
    
    var names = [String]();
    var people = [NSManagedObject]();

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self;
        tableView.delegate = self;
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return };
        
        let managedContext = appDelegate.persistentContainer.viewContext;
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person");
        
        do {
            people = try managedContext.fetch(fetchRequest);
        } catch let error as NSError {
            print("No se ha podido obtener los datos: \(error), \(error.userInfo)");
        }
    }

    @IBAction func addName(_ sender: Any) {
        
        let alert = UIAlertController(title: "Nuevo nombre", message: "Anyadir un nombre de usuario", preferredStyle: .alert);
        
        let saveAction = UIAlertAction(title: "Aceptar", style: .default) { action -> Void in
            guard let textField = alert.textFields?.first, let nameToSave = textField.text else { return };
            
            self.save(name: nameToSave);
            
            self.tableView.reloadData();
        };
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel);
        
        alert.addTextField();
        alert.addAction(saveAction);
        alert.addAction(cancelAction);
        
        present(alert, animated: true);
    }
    
    func save (name: String) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return };
        
        let managedContext = appDelegate.persistentContainer.viewContext;
        
        let entity = NSEntityDescription.entity(forEntityName: "Person", in: managedContext)!;
        
        let person = NSManagedObject(entity: entity, insertInto: managedContext);
        person.setValue(name, forKey: "name");
        
        do {
            try managedContext.save();
            people.append(person);
        } catch let error as NSError {
            print("No se ha podido guardar: \(error), \(error.userInfo)");
        }
    }
    
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath);
        let person = people[indexPath.row];
        
        cell.textLabel?.text = person.value(forKeyPath: "name") as? String;
        
        return cell;
    }
}

extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = people[indexPath.row];
        
        let alert = UIAlertController(title: "Nuevo nombre", message: "Anyadir un nombre de usuario", preferredStyle: .alert);
        
        let saveAction = UIAlertAction(title: "Aceptar", style: .default) { action -> Void in
            guard let textField = alert.textFields?.first, let nameToSave = textField.text else { return };
            
            person.setValue("", forKey: "name");
            
            self.tableView.reloadData();
        };
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel);
        
        alert.addTextField();
        alert.addAction(saveAction);
        alert.addAction(cancelAction);
        
        present(alert, animated: true);
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Borrar") { (action, view, completionHandler) in
            
            let person = self.people[indexPath.row];
            
            let managedContext = person.managedObjectContext;
            
            managedContext?.delete(person);
            
            do {
                try managedContext?.save();
            } catch let error as NSError {
                print("No se ha podido eliminar el objeto: \(error), \(error.userInfo)")
            }
            
            self.people.remove(at: indexPath.item);
            tableView.reloadData();
            
            completionHandler(true);
        }
        
        deleteAction.backgroundColor = .systemRed;
        
        return UISwipeActionsConfiguration(actions: [deleteAction]);
        
    }
    
}
