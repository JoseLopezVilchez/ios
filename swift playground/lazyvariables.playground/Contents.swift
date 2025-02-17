import UIKit

struct Ejemplo {
    init() {
        print("Blah");
    }
}

struct Blah {
    var blah : String;
    lazy var ejemplo = Ejemplo(); //solo se inicia cuando se va a usar
    
    
}

var blorb = Blah(blah: "Wah");
blorb.ejemplo; //ahora se iniciaria

// ----------------------

struct Ejemplo2 {
    static var essamplo = 0;
    var wololo : String;
    
    init(wololo: String) {
        self.wololo = wololo;
        essamplo += 1;
    }
}

let a = Ejemplo2(wololo: "Wololo");
let b = Ejemplo2(wololo: "Lolowo");


struct Celsius {
    var tempCelsius : Double;
    
    init (desdeFahrenheit fahrenheit : Double) { //inicializador
        tempCelsius = (fahrenheit - 32) / 1.8;
    }
    
    init (desdeKelvin kelvin : Double) { //inicializador
        tempCelsius = kelvin - 273.15;
    }
}

struct ValoresVitales {
    var fuerza : Int;
    var vida : Int;
}

class Enemigo {
    let nombre : String;
    let vital : ValoresVitales;
    
    init (nombre: String, vital : ValoresVitales) {
        self.nombre = nombre;
        self.vital = vital;
    }
    
    convenience init (nombre : String, fuerza : Int, vida : Int) { //inicializador de conveniencia
        self.init(nombre: nombre, vital: ValoresVitales(fuerza: fuerza, vida: vida));
    }
    
    func grito () {
        print("Avast, ye!");
    }
}

let malote = Enemigo(nombre: "Malote", vital: ValoresVitales(fuerza: 5, vida: 5));
let maloso = Enemigo(nombre: "Maloso", fuerza: 5, vida: 5);

struct Persona {
    var nif : String;
    
    init? (nif : String) { //inicializador fiable - puede devolver o una instancia o un nil
        if nif.count == 9 {
            self.nif = nif;
        } else {
            return nil;
        }
    }
}

let persona = Persona(nif: "12345678B");
let nosona = Persona(nif: "blergh");
persona?.nif
nosona?.nif

// Deinicializadores - solo las clases los tienen! Y es un codigo ejecutado cuando la instancia se destruye, no una forma de destruir instancias!

class Mocoso {
    var neim = "Dohn Joe";
    
    init () {
        print("\(neim) ha nacido!");
    }
    
    deinit {
        print("\(neim) ha hecho la moridura!");
    }
}

for _ in 1...4 {
    let moco = Mocoso();
}

class Orco : Enemigo { //Herencia
    var clan : String;
    
    init (nombre : String, vital : ValoresVitales, clan : String) {
        self.clan = clan;
        super.init(nombre: nombre, vital: vital);
    }
    
    convenience init (nombre : String, fuerza : Int, vida : Int, clan : String) {
        self.clan = clan;
        self.init(nombre: nombre, fuerza: fuerza, vida: vida, clan: clan);
    }
    
    override func grito() {
        print("I WILL DRINK FROM YOUR SKULL!");
    }
}

var orco = Orco(nombre: "Grok", fuerza: 100, vida: 100, clan: "Gorthokol");
orco.grito();

//operador 'is'

if orco is Enemigo {
    print("Es un enemigo!");
}

// extensiones

extension Enemigo { //No se pueden meter variables almacenadas, pero si se pueden meter funciones y variables calculadas
    var valia : Int {
        return (self.vital.fuerza * self.vital.vida);
    }
}
print(orco.valia);

extension Int {
    func squared() -> Int {
        return self * self;
    }
}

print (2.squared());

//finales

final class Grok : Orco { //no es posible hacer que otras clases hereden de una clase final
    var trofeos : Int;
    
    init(trofeos: Int) {
        self.trofeos = trofeos
    }
}

//funciones operadoras

struct Vector2D {
    var x : Double = 0.0, y : Double = 0.0;
    
    static func + (izquierda : Vector2D, derecha : Vector2D) -> Vector2D { //funcion operadora usando un operador binario infijo (que va en mitad) - hay operadores prefijos, infijos y sufijos
        return Vector2D(x : izquierda.x + derecha.x, y : izquierda.y + derecha.y);
    }
    
    static prefix func - (vector : Vector2D) -> Vector2D {
        return Vector2D(x : -vector.x, y : -vector.y);
    }
}

var vector1 = Vector2D(x : 1, y : 2);
var vector2 = Vector2D(x : 2, y : 3);
var vectorfinal = vector1 + vector2;

print(vectorfinal);


extension Int {
    //unario sufijo
    static postfix func ++ (numero: inout Int) -> Int { //ESTO ES LA POLLA
        let viejo = numero;
        numero += 1;
        return viejo;
    }
    
    static prefix func ++ (numero: inout Int) { //ESTO ES LA POLLA TAMBIEN
        numero += 1;
    }
}

var numerillo = 1;
print(numerillo++);
print(++numerillo);

let enemigo : Enemigo = orco; //Upcasting - meter una clase hija en un espacio de la clase padre
orco = Enemigo(nombre: "Nork", fuerza: 2, vida: 4) as! Orco; //downcasting sin validacion - meter una clase padre en un espacio de la clase hija haciendo typecasting
if let morco = enemigo as? Orco { //downcasting con validación
    print("Es un orco del clan \(morco.clan).");
} else {
    print("No es un orco!");
}
