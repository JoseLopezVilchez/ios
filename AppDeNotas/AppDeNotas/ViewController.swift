//
//  ViewController.swift
//  AppDeNotas
//
//  Created by dam2 on 12/2/25.
//

/*
 Funcionalidades:

 -Mostrar la lista de tareas guardadas en Core Data en una UITableView. (10 ptos)

 -Editar el nombre de la tarea al tocar sobre ella. (10 ptos)

 -Marcar/desmarcar una tarea como completada mediante un UISwitch o SwipeAction en cada celda. (10 ptos)

 -Eliminar una tarea deslizando la celda (swipe to delete). (10 ptos)

 -Botón para filtrar las tareas completadas (permitirá visualizar todas las tareas o sólo las no completadas) (10 ptos)

 -Añadir un botón a cada celda para compartir la nota. (10 ptos)

 -Persistencia de datos con CoreData. (15 pts)

 -La interfaz de la aplicación debe estar en inglés y español. (15 pts)
 */

import UIKit;
import CoreData;

class ViewController: UIViewController {
    
    @IBOutlet weak var switchFilter : UIBarButtonItem!
    
    @IBOutlet weak var tableView : UITableView!
    
    var notas = [NSManagedObject]();
    
    override func viewDidLoad() {
        
        super.viewDidLoad();
        
        tableView.delegate = self;
        tableView.dataSource = self;
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return };
        
        let managedContext = appDelegate.persistentContainer.viewContext;
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Nota");
        
        do {
            notas = try managedContext.fetch(fetchRequest);
        } catch let error as NSError {
            print("No se ha podido obtener los datos: \(error), \(error.userInfo)");
        }
        
    }
    
    
    @IBAction func nuevaNota(_ sender: Any) {
        
        //-Agregar una nueva tarea mediante un UIAlertController con un campo de texto. (10 ptos)
        
        let alertController : UIAlertController = UIAlertController(
            title: "Anyadir tarea",
            message: "Introduzca una nueva tarea a completar",
            preferredStyle: UIAlertController.Style.alert
        );
        
        alertController.addAction(UIAlertAction(
            
            title: "Aceptar",
            style: .default,
            handler: { (action) in
                guard let fields = alertController.textFields else { return }
                
                if let tarea = fields[0].text {
                    self.save(title: tarea);
                    self.tableView.reloadData();
                }
            }
            
        ));
        alertController.addAction(UIAlertAction(
            
            title: "Cancelar",
            style: .cancel

        ));
        alertController.addTextField();
        
        self.present(alertController, animated: true);
        
    }
    
    func save (title : String) {
        
        /*guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return };
        let managedContext = appDelegate.persistentContainer.viewContext;*/
        
        let entity = NSEntityDescription.entity(forEntityName: "Nota", in: managedContext)!;
        
        let nota = NSManagedObject(entity: entity, insertInto: managedContext);
        nota.setValue(title, forKey: "title");
        
        /*do {
            try managedContext.save();
            notas.append(nota);
        } catch let error as NSError {
            print("No se ha podido guardar: \(error), \(error.userInfo)");
        }*/
        
        dataStorage {
            notas.append(nota);
        }
    }
    
    func managedContext () -> NSManagedObjectContext { //la idea seria no tener que soltar un opcional, pero no hay cojones
        let appDelegate = UIApplication.shared.delegate as? AppDelegate;
        return appDelegate?.persistentContainer.viewContext;
    }
    
    func dataStorage (accion : () -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return };
        let managedContext = appDelegate.persistentContainer.viewContext;
        
        do {
            try managedContext.save();
            accion();
        } catch let error as NSError {
            print("No se ha podido guardar: \(error), \(error.userInfo)");
        }
    }

}

extension ViewController : UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {return 1;}
}

extension ViewController :  UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notas.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "Celda", for: indexPath) as! Celda;
        
        celda.viewController = self;
        celda.posicion = indexPath.row;
        celda.texto.text = notas[indexPath.row].value(forKeyPath: "title") as? String;
        
        return celda;
    }
    
}

extension ViewController : RewriteNote {
    func rewriteNote(title : String, posicion : Int) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return };
        let managedContext = appDelegate.persistentContainer.viewContext;
        
        do {
            try managedContext.save();
            notas[posicion].setValue(title, forKey: "title");
        } catch let error as NSError {
            print("No se ha podido guardar: \(error), \(error.userInfo)");
        }
        
        tableView.reloadData();
    }
}
