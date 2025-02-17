//
//  ViewController.swift
//  PantallaDeLogin2C_JoseLopezVilchez
//
//  Created by dam2 on 19/11/24.
//

import UIKit

class ViewController: UIViewController, TriggerDelegate {
    
    @IBOutlet weak var boton: UIButton!
    @IBOutlet weak var userField: UITextField!
    @IBOutlet weak var passField: UITextField!
    
    func deshabilitar() {
        boton.isEnabled = false;
        boton.setTitle("Sin conexión", for: .disabled);
    }
    
    var ultimosLogins : [(usuario : String, contrasenya : String)] = [];
    
    let storyBoard = UIStoryboard(name: "Main", bundle: nil); //Instancia del Storyboard 'Main' (mismo nombre que el archivo)
    
    lazy var pantallaBoton: PantallaBotonViewController = {
        return storyBoard.instantiateViewController(withIdentifier: "pantallaBoton") as! PantallaBotonViewController
    }() //Instancia del ViewController 'personalizado' (hay que crear un archivo .swift con la clase, y asignarlo al view controller que le corresponda en el storyboard)
    //He creado esta variable como variable de clase para poder acceder a ella desde el contexto tanto de la funcion login como de funcionAlumno. Para ello, he necesitado hacerla lazy (se inicializa cuando es usada por primera vez), de lo contrario no furula
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    @IBAction func funcionAlumno(_ sender: Any) {
        
        let pantallaAlerta : UIAlertController = UIAlertController(
            title: "Elige tu modulo",
            message: "¿Eres de DAM o de Animaciones?",
            preferredStyle: UIAlertController.Style.actionSheet
        ); //Crea instancia de un ViewController de tipo UIAlertController
        
        pantallaAlerta.addAction(UIAlertAction( //Creo y asigno acciones al alert
            
            title: "DAM",
            style: .default,
            handler: { (action) in
                self.pantallaBoton.curso = "DAM";
                self.pantallaBoton.cursoChecker();
            }

        ));
        pantallaAlerta.addAction(UIAlertAction(
            
            title: "Animaciones",
            style: .default,
            handler: { (action) in
                self.pantallaBoton.curso = "Animaciones";
                self.pantallaBoton.cursoChecker();
            }
            
        ));
        
        self.present(pantallaAlerta, animated: true);
    }
    
    @IBAction func login(_ sender: Any) {
        if let usuario = userField.text, usuario != "", let contrasenya = passField.text, contrasenya != "", pantallaBoton.curso != "", contrasenya == "\(usuario)." { //Comprueba que no estén vacíos los text input y meto sus valores en constantes
            
            pantallaBoton.usuario = usuario;
            pantallaBoton.pass = contrasenya; //Usando la instancia del view controller, es posible modificar sus propiedades
            pantallaBoton.delegate = self;
            
            userField.text = ""; //Limpio los campos antes de cambiar de pantalla
            passField.text = "";
            
            //Manejo el listado de últimos logins
            ultimosLogins.insert((usuario : usuario, contrasenya : contrasenya), at: 0) // Inserta al inicio
            if ultimosLogins.count > 3 { ultimosLogins.removeLast() } // Mantiene longitud de 3
            
            //Presentamos el viewController creado anteriormente
            self.navigationController?.pushViewController(pantallaBoton, animated: true)
        } else {
            
            let pantallaAlerta : UIAlertController = UIAlertController(
                title: "Error",
                message: "",
                preferredStyle: UIAlertController.Style.alert
            );
            
            pantallaAlerta.addAction(UIAlertAction(title: "Ok", style: .cancel));
            
            if (userField.text == "" || passField.text == "") {
                pantallaAlerta.message = "¡Los campos de usuario y contrasenya no deben estar vacios!";
            } else if (pantallaBoton.curso == "") {
                pantallaAlerta.message = "¡Debes seleccionar tu curso!";
            } else {
                pantallaAlerta.message = "Contrasenya incorrecta";
            }
            
            self.present(pantallaAlerta, animated: true);
        }
    }
    
    
    @IBAction func recuperar(_ sender: Any) {
        let pantallaAlerta : UIAlertController = UIAlertController(
            title: "Ultimos logins",
            message: "Me ha apetecido darle una funcionalidad algo extra :) (aunque no lo meteria en produccion por razones obvias)",
            preferredStyle: UIAlertController.Style.actionSheet
        );
        
        if (!ultimosLogins.isEmpty) {
            for i in ultimosLogins {
                
                pantallaAlerta.addAction(UIAlertAction(
                    
                    title: i.usuario,
                    style: .default,
                    handler: { (action) in
                        self.userField.text = i.usuario;
                        self.passField.text = i.contrasenya;
                    }
                    
                ));
                
            }
        }
        
        pantallaAlerta.addAction(UIAlertAction(
            
            title: "Cancelar",
            style: .cancel
            
        ));
        
        self.present(pantallaAlerta, animated: true);
    }
    
}

