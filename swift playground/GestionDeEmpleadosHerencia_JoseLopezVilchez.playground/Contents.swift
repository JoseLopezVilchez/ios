import UIKit

/*Crear un programa para la gestión de empleados.
Los empleados deben tener nombre, edad y salario.
También tendrán una constante llamada plus, con un valor de 200€
Habrá 2 tipos de empleados: Programador y Comercial.
El comercial, además tendrá un atributo llamado "comision", de tipo Double
El programador tendrá un atributo llamado "lenguaje", de tipo String.
Crea los inicializadores necesarios, getters, setters y métodos toString que describan al trabajador.
No podrán ser trabajadores los menores de 18 años.
Las clases Programador y Comercial tendrán un método llamado "plus" con una implementación distinta, según el caso. Esta función aumentará el salario del empleado:
-Si es comercial, en el caso de que tenga más de 30 años y cobre una comisión de más de 200€, se le aplicará el plus.
-Si es programador, si tiene menos de 25 y programa en "Swift", recibirá el plus.

Crear al menos 3 empleados con diferentes características.*/

class Empleado {
    var nombre : String;
    private var age : Int;
    var salario : Float;
    let plus : Float = 200.0;
    
    init?(nombre: String, edad: Int, salario: Float) {
        if (edad > 17) {
            self.nombre = nombre;
            self.age = edad;
            self.salario = salario;
        } else {
            return nil;
        }
    }
    
    var edad : Int {
        get {
            return age;
        }
        set (nuevaEdad) {
            if (nuevaEdad > 17) {
                age = nuevaEdad;
            } else {
                print("Error: un trabajador no puede tener menos de 18 anyos. Cambio revertido.");
            }
        }
    }
    
    func aplicarPlus () {
        if (type(of: self) != Empleado.self) {
            fatalError("Este metodo necesita ser reescrito en clases hijas");
        }
    }
    
    func toString () -> String {
        return "Nombre -> \(nombre) / Edad -> \(age) / Salario -> \(salario)";
    }
}

class Programador : Empleado {
    var lenguaje : String;
    
    init?(lenguaje: String, nombre: String, edad: Int, salario: Float) {
        self.lenguaje = lenguaje;
        super.init(nombre: nombre, edad: edad, salario: salario);
    }
    
    override func aplicarPlus() {
        if (lenguaje == "Swift" && edad < 25) {
            salario += plus;
        }
    }
    
    override func toString() -> String {
        return "\(super.toString()) / Lenguaje -> \(lenguaje)";
    }
}

class Comercial : Empleado {
    var comision : Double;
    
    init?(comision: Double, nombre: String, edad: Int, salario: Float) {
        self.comision = comision;
        super.init(nombre: nombre, edad: edad, salario: salario);
    }
    
    override func aplicarPlus() {
        if (comision > 200 && edad > 30) {
            salario += plus;
        }
    }
    
    override func toString() -> String {
        return "\(super.toString()) / Comision -> \(comision)";
    }
}

//A partir de aqui son pruebas

let empleadoBase = Empleado(nombre: "Paco", edad: 18, salario: 1200.32);
var empleadoProgramador = Programador(lenguaje: "Swift", nombre: "Pocho", edad: 14, salario: 12.12); //saca nil por ser un menor
empleadoProgramador = Programador(lenguaje: "Swift", nombre: "Pacho", edad: 19, salario: 12.12);
let empleadoComercial = Comercial(comision: 204.23, nombre: "Pabli", edad: 400, salario: 1666.24);

// empleadoBase?.aplicarPlus(); //esto causa un error hecho a proposito

print(empleadoProgramador?.salario ?? "blah");
empleadoProgramador?.aplicarPlus();
print(empleadoProgramador?.salario ?? "blah");

print(empleadoBase?.toString() ?? "blah");
print(empleadoProgramador?.toString() ?? "blah");
print(empleadoComercial?.toString() ?? "blah");
