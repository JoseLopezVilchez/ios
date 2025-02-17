import UIKit

//1. Crear una clase llamada SimpleCar con 3 propiedades:
/*2. marca, en formato de texto. No se podrá cambiar
modelo, en formato de texto. No se podrá cambiar
nBas, número de bastidor. No se podrá cambiar */
//3. Función init

class SimpleCar {
    let marca : String;
    let modelo : String;
    
    nonisolated(unsafe) private static var conteoBastidores : Int = 0;
    
    let nBas : Int;
    
    init(marca: String, modelo: String) {
        self.marca = marca;
        self.modelo = modelo;
        SimpleCar.conteoBastidores += 1;
        self.nBas = SimpleCar.conteoBastidores;
    }
    
    func pitar () {
        print("Honk honk");
    }
}

//4. Crear una clase Coche que herede de SimpleCar
//5. Esta clase debe tener:
// anno de lanzamiento, entero, sólo lectura
//6. color, de tipo Color, se puede cambiar el color (mediante una enumeración, que el coche sólo pueda ser blanco, negro, rojo, amarillo o azul)
//7. Sobreescribir el init de la clase padre para añadir color y año

class Coche : SimpleCar {
    
    enum Color {
        case blanco
        case negro
        case rojo
        case azul
        case amarillo
    }
    
    private let annoLanzamiento : Int;
    var color : Coche.Color;
    
    init(annoLanzamiento: Int, color: Coche.Color, marca: String, modelo: String) {
        self.annoLanzamiento = annoLanzamiento;
        self.color = color;
        super.init(marca: marca, modelo: modelo);
    }
    
    override func pitar() {
        print("Beep beep!");
    }
    
}

//8. Crear un Renault Megane, del año 2009, blanco

let renaultmegane = Coche(annoLanzamiento: 2009, color: Coche.Color.blanco, marca: "Renaul", modelo: "Megane");

//9. Pintar el coche de color negro

renaultmegane.color = Coche.Color.negro;

//10. Crear la función pitar para que el coche imprima en consola el sonido del claxon. Hacer que pite el coche.
//11. (opcional) Declarar la función pitar en la clase SimpleCar y sobreescribirla en Coche

renaultmegane.pitar();

//12. Crear la clase Policía, que hereda de Coche
//13. (opcional) El coche de policía sólo puede ser blanco o azul
//14. (opcional) Implementar la función sirena, que imprime el sonido en consola.

class Policia : Coche {
    
    override init(annoLanzamiento: Int, color: Coche.Color, marca: String, modelo: String) {
        super.init(annoLanzamiento: annoLanzamiento, color: color == .blanco ? color : (color == .azul ? color : .azul), marca: marca, modelo: modelo);
    }
    
    func sirena () {
        print("Wee woo!");
    }
}

//15. (opcional) Hacer sonar la sirena.

let poli = Policia(annoLanzamiento: 1990, color: .amarillo, marca: "Koxe", modelo: "Kutr");

print("\(poli.color)"); //si el color no es blanco ni azul, deja azul por defecto
poli.sirena();
