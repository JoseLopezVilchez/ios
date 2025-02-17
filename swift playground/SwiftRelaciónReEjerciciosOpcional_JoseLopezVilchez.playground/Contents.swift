import UIKit

//1. Contar del 1 al 50 usando for y decir cuales son múltiplos de 3

var solucion1 : [Int] = [];

for i in 1...50 where i % 3 == 0 {
    solucion1.append(i);
}

print("Ej 1: los multiplos de 3 entre 1 y 50 son: \(solucion1).");

//2. Mostrar los números divisibles entre 7 y 3 que estén entre el 100 y el 200, usando un bucle for in

var solucion2 : [Int] = [];

for i in 100...200 where i % 3 == 0 && i % 7 == 0 {
    solucion2.append(i);
}

print("Ej 2: los multiplos de 3 y 7 entre 100 y 200 son: \(solucion2).");

//3. Mostrar del 15 al 5 descendiendo

var solucion3 : [Int] = [];

for i in 5...15 {
    solucion3.append(i);
}

print("Ej 3: del 15 al 5 descendiente: \(Array(solucion3.reversed())).");

//4. Imprimir el máximo común divisor de dos números

let numeros = (100, 1000);
var solucion4 = 1;
    
for i in Array(numeros.0 > numeros.1 ? 1...numeros.1 : 1...numeros.0).reversed() where numeros.0 % i == 0 && numeros.1 % i == 0 { //comprueba cual es el mayor y el menor
    solucion4 = i;
    break;
}

print("Ej 4: el maximo comun divisor de los numeros \(numeros.0) y \(numeros.1) es \(solucion4)");

//5. Escribir un programa en swift que cree un array de 100 posiciones con números enteros aleatorios entre 0 y 10. Imprimir cuántas veces aparece el 3 y cuántas el 5

let arraySolucion5 = (1...100).map { _ in Int.random(in: 0...10) }
var conteo35 = (0, 0);

for i in arraySolucion5 {
    if (i == 3) {
        conteo35.0 += 1;
    }
    if (i == 5) {
        conteo35.1 += 1;
    }
}

print("Ej 5: dado el array \(arraySolucion5), el numero de treses es \(conteo35.0), y el numero de cincos es \(conteo35.1).");

//6. Imprimir el número de enteros en este array
let arrany:[Any] = [4,6,4.7,245,6.7,34,7.2,3,42,775,54.6,"Juan",32.0,124];

var solucion6 = 0;

for i in arrany where i is Int {
    solucion6 += 1;
}

print("Ej 6: en el array \(arrany), el numero de enteros es \(solucion6).");

//7. Imprimir cuántas veces aparece el número 3 en el array arrany

var solucion7 = 0;

for i in arrany {
    if let numero = i as? Int, numero == 3 {
        solucion7 += 1;
    }
}

print("Ej 7: el numero de treses en el array \(arrany) es \(solucion7).");

//8. Separar el array arrany en 3 arrays: uno de enteros, otro de doubles y otro de strings. Imprimir los 3 arrays después de crearlos.

var solucion8 : (ints : [Int], doubles : [Double], strings : [String]) = ([], [], []);

for i in arrany {
    if i is Int {
        solucion8.ints.append(i as! Int);
    }
    if i is Double {
        solucion8.doubles.append(i as! Double);
    }
    if i is String {
        solucion8.strings.append(i as! String);
    }
}

print("Ej 8: dado el array \(arrany), los enteros son \(solucion8.ints), los doubles son \(solucion8.doubles), y los strings son \(solucion8.strings).");

//9. Duplicar el primer y último caracter de este string. Almacenarlo en una variable e imprimirlo en pantalla.
var fraseHola = "¡Hola EsTech!";
let solucion9 = "\(fraseHola.prefix(1))\(fraseHola)\(fraseHola.suffix(1))";


print("Ej 9: dado el string '\(fraseHola)', el resultado de duplicar el primer y ultimo caracter sería \(solucion9).");

//10. Crear un string con los dos últimos caracteres de fraseHola

print("Ej 10: dado el string '\(fraseHola)', el string hecho de los dos ultimos caracteres es '\(fraseHola.suffix(2))'.");

//11. Imprimir en pantalla la primera mitad de un string (utilizar fraseHola como ejemplo)

print("Ej 11: dado el string '\(fraseHola)', su primera mitad es '\(fraseHola.prefix(fraseHola.count/2))'.");

//12. Crear un string a partir de fraseHola donde se han movido los 2 primeros caracteres al final del string.

let rango = fraseHola.startIndex..<fraseHola.index(fraseHola.startIndex, offsetBy: 2);

let substring = fraseHola[rango];

print("Ej 12: dado el string \(fraseHola), ", terminator: "");

fraseHola.removeSubrange(rango);

print("tras mover los 2 primeros caracteres al final, el resultado es \(fraseHola)\(substring)");

//13. ¿Cuántas veces aparece la letra “a” en fraseHola

fraseHola = "¡Hola EsTech!";

print("Ej 13: dado el string \(fraseHola), el numero de letras 'a' que contiene es \(fraseHola.filter {$0 == "a"}.count).");
