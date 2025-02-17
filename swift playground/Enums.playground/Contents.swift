import UIKit

enum Direccion : String {
    case norte = "north"
    case sur = "south"
    case este = "east"
    case oeste = "west"
    
    func ejemplo () -> String {
        switch self {
        case .norte :
            return "ejemplo norte";
        case .sur :
            return "ejemplo sur";
        case .este :
            return "ejemplo este";
        case .oeste :
            return "ejemplo oeste";
        }
    }
    
    
}

print("\(Direccion.este.ejemplo())");

// -----------------

enum Ejemplo : Int {
    case uno = 1
    case dos = 2
    case tres = 3
    case cuatro = 4
}

let eyempol = Ejemplo(rawValue: 2); //igual a meterle un .dos usando rawValue. Puede salir nil si se le mete un valor superior a los que hay.
let eyempol2 = Ejemplo.dos.rawValue; //igual a un 2 (numero) usando tambien rawValue.

indirect enum ExpresionAritmetica {
    case numero(Int)
    case suma(ExpresionAritmetica, ExpresionAritmetica)
    case multiplicacion(ExpresionAritmetica, ExpresionAritmetica)
}

let cinco = ExpresionAritmetica.numero(5);
let cuatro = ExpresionAritmetica.numero(4);
