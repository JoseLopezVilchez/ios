import UIKit

//1. Crea una clase llamada Persona. Esta clase deberá tener un atributo «nombre», de tipo String. También deberá tener un método «setNombre», con un parámetro String, que permita cambiar el valor del nombre. Finalmente, también tendrá un método «saludar», que escribirá en pantalla «Hola, soy » seguido de su nombre.

class Persona {
    var nombre : String;
    
    func setNombre (nombre: String) {
        self.nombre = nombre;
    }
    
    func saludar () {
        print("Hola, soy \(self.nombre).");
    }
    
    init(nombre: String) {
        self.nombre = nombre;
    }
}

//2. Crea también una clase llamada PruebaPersona. Esta clase deberá contener sólo la función main, que creará dos objetos de tipo Persona, les asignará un nombre a cada uno y les pedirá que saluden.

class PruebaPersona {
    static func main (nombres: String...) {
        var objetos : [Persona] = [];
        for nombre in nombres {
            objetos.append(Persona(nombre: nombre));
        }
        for objeto in objetos {
            objeto.saludar();
        }
    }
}

PruebaPersona.main(nombres: "Paco", "Pollo");

//3. Crear la clase «PersonaInglesa», que hereda de Persona, donde redefina el método «saludar», para que escriba en pantalla «Hi, I am » seguido de su nombre;

class PersonaInglesa : Persona {
    override func saludar () {
        print("Greetings, mine own name be \(self.nombre).");
    }
}

//4. Se creará una nueva clase «PersonaItaliana», que deberá heredar las características de la clase «Persona», pero se deberá redefinir el método «saludar», para que escriba en pantalla «Ciao»;

class PersonaItaliana : Persona {
    override func saludar () {
        print("Ciao. Non tagliate gli spaghetti con le forbici!");
    }
}

//5. Crea también una clase llamada PruebaPersona3, que deberá contener sólo la función «main» y creará un objeto de tipo «Persona», uno de tipo «PersonaInglesa», y uno de tipo «PersonaItaliana», les asignará un nombre y les pedirá que saluden.

class PruebaPersona3 {
    static func main (nombres: [String]) {
        var objetos : [Persona] = [];
        objetos.append(PersonaItaliana(nombre: nombres[0]));
        objetos.append(PersonaInglesa(nombre: nombres[1]));
        objetos.append(Persona(nombre: nombres[2]));
        for objeto in objetos {
            objeto.saludar();
        }
    }
}

PruebaPersona3.main(nombres: ["Italianito", "Henrick", "Pedro"]);
