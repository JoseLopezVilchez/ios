//UserDefaults

/*
 Es un diccionario
 Almacena variables de configuración
 Mantiene la información mientras la aplicación está instalada
 Tipos que puede almacenar: booleans, strings, arrays, diccionarios, fechas...
 Pero no deja tuplas
 Siempre está cargado cuando la aplicación funciona, con lo que cuidado con no meterle demasiada mierda porque termina pesando!
*/

import Foundation;


let defaults = UserDefaults.standard;

//Almacena elementos vía relación clave - valor
defaults.set(true, forKey: "ejemploBool");
defaults.set("String", forKey: "ejemploString");
defaults.set(CGFloat.pi, forKey: "ejemploFloat"); //cgfloat.pi sirve para sacar el número pi
defaults.set([1, 2, 3, 4, 5], forKey: "ejemploArray");
defaults.set(Date.now, forKey: "ejemploFecha"); //date.now saca la fecha actual
defaults.set(["Ejemplo" : "EJ", "esamplo" : 1], forKey: "ejemploDiccionario");

//Recuperar valores - hay un método por cada tipo a recuperar!
let ejemploRecuperado = defaults.string(forKey: "ejemploString");
print(ejemploRecuperado ?? "Nu funsiona");

let ejemploFloat = defaults.float(forKey: "ejemploFloat");

let ejemploArray = defaults.array(forKey: "ejemploArray");
let ejemploDiccionario = defaults.dictionary(forKey: "ejemploDiccionario");

var ejemploFecha = defaults.value(forKey: "ejemploFecha"); //value es genérico
ejemploFecha = defaults.object(forKey: "ejemploFecha"); //object saca cosas más complejas

//Eliminar valores
defaults.removeObject(forKey: "gdurgsf") //Si le pides un valor que no existe, devuelve nil y ya pero no salta error. Si sí existe, devuelve lo eliminado

//Eliminar todos los valores
let diccionario = defaults.dictionaryRepresentation(); //Esto saca todos los elementos cual diccionario, lo cual permite recorrerlo

diccionario.keys.forEach {key in
    defaults.removeObject(forKey: key); //Esto recorre las claves del diccionario sacado de UserDefaults y va eliminando
}

//Property Wrapper
struct UserData {
    @Storage(key : "userdata_name", defaultValue : "")
    var name : String;
    @Storage(key : "userdata_token", defaultValue : "")
    var token : String;
}

@propertyWrapper
struct Storage<T> {
    private let key : String;
    private let defaultValue : T;
    
    init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue : T {
        get {
            //Lee el valor de UserDefaults
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue;
        }
        set {
            //Guarda valor en UserDefaults
            UserDefaults.standard.set(newValue, forKey: key); //Nota: newValue es el nombre por defecto que se refiere al único input del set
        }
    }
}

var userData = UserData();
userData.name = "Blah";



let ejemploDatos = defaults.data(forKey: "ejemploString");
print(ejemploDatos ?? "Sigue sin funsional");
