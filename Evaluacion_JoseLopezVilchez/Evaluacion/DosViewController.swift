//
//  DosViewController.swift
//  Examen_240208
//
//  Created by Alfonso Marín on 7/2/24.
//

import UIKit
import CoreData

class DosViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var image: UIImageView!

    //@IBOutlet weak var nameLabel: UILabel!
    //@IBOutlet weak var mailName: UILabel!
    //@IBOutlet weak var phoneName: UILabel!

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var mailField: UITextField!
    @IBOutlet weak var phoneField: UITextField!

    @IBOutlet weak var sendButton: UIButton!
    
    var contactos = [NSManagedObject]();

    override func viewDidLoad() {
        super.viewDidLoad();
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return };
        
        let managedContext = appDelegate.persistentContainer.viewContext;
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Contacto");
        
        do {
            contactos = try managedContext.fetch(fetchRequest);
        } catch let error as NSError {
            print("No se ha podido obtener los datos: \(error), \(error.userInfo)");
        }
    }

    @IBAction func enviar(_ sender: Any) {
        
        guard let name = nameField.text, !name.isEmpty, let mail = mailField.text, !mail.isEmpty, let phone = phoneField.text, !phone.isEmpty, let appDelegate = UIApplication.shared.delegate as? AppDelegate
        else {
            print("Faltan campos, o el appDelegate ha hecho kapoof");
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext;
        
        let entity = NSEntityDescription.entity(forEntityName: "Contacto", in: managedContext)!;
        
        let contacto = NSManagedObject(entity: entity, insertInto: managedContext);
        contacto.setValue(name, forKey: "name");
        contacto.setValue(mail, forKey: "mail");
        contacto.setValue(phone, forKey: "phone");
        
        do {
            try managedContext.save();
            contactos.append(contacto);
        } catch let error as NSError {
            print("No se ha podido guardar: \(error), \(error.userInfo)");
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

protocol Load {
    func load ()
}
