import UIKit

/* Desarrollar un programa en swift que... */
//1. (Opcional) Que escriba los primeros 25 dígitos de la sucesión de Fibonacci.

var fibonacci = [0, 1];

for i in 1..<24 {
    fibonacci.append(fibonacci[i] + fibonacci[i-1]);
}

print("Ej 1: \(fibonacci)");

//2. Imprime "Buscando el número X" siendo X un número aleatorio. A continuación imprime números aleatorios entre 1 y 20 hasta que coincida con X.

let buscado = Int.random(in: 1...20);
var buscador = 0;

print("Ej 2: Buscando el numero \(buscado): ", terminator: "");
while (buscador != buscado) {
    buscador = Int.random(in: 1...20);
    print("\(buscador), ", terminator: "");
}
print ("");

//3. Imprimir el número más pequeño
let n1 = 3, n2 = 8, n3 = 5, n4 = 6

let peque = [n1, n2, n3, n4];

print("Ej 3: El numero mas pequenyo es: \(peque.min() ?? 0).");

/*4. Escribir un switch que imprima:
"Aquí" si la distancia es 0
"Aquí al lado" si está a menos de 5
"Se puede ir andando" si está entre 5 y 30
"Lejos" si es menos de 60
"Muy lejos" más de 60
*/
let distancia = 15

print("Ej 4: ", terminator: "");
switch true {
    case distancia == 0:
    print ("Aqui");
    break
    case distancia < 5:
    print ("Aqui al lado");
    break
    case distancia >= 5 && distancia <= 30:
    print ("Se puede ir andando");
    break
    case distancia <= 60:
    print ("Lejos");
    break
    case distancia > 60:
    print ("Muy lejos");
    break
    default:
    print ("Distancia negativa. ¿Eres un viajero dimensional?");
    break
}

//5. Crea un array de tipo char con 26 elementos. Rellena el array con los números del 65 al 90, ambos incluidos. Por último, imprime todos los elementos del array.
//Nota: Casting Int to Char -> Character(UnicodeScalar(i)!)

var arrayChar : [Character] = [];

for i in 65...90 {
    arrayChar.append(Character(UnicodeScalar(i)!));
}

print("Ej 5: \(arrayChar)");

//6. (Opcional) Crea dos arrays (A y B) de tamaño 5 y rellénalo con números. Después crea un tercero con el doble de tamaño cuyos valores serán: el 1º de A, el 1º de B, el 2º de A, el 2º de B, etc.

var arrayA : [Int] = [];
var arrayB : [Int] = [];
var arrayCombinado : [Int] = [];

for _ in 0...4 {
    arrayA.append(Int.random(in: 0...100));
    arrayB.append(Int.random(in: 0...100));
}

for (i, valor) in arrayA.enumerated() {
    arrayCombinado.append(valor);
    arrayCombinado.append(arrayB[i]);
}

print("Ej 6: Los dos arrays iniciales son \(arrayA) y \(arrayB), y el final es \(arrayCombinado)");

//7. Crea un array de dos dimensiones de tamaño 2x5 con los valores enteros que quieras. Crea un tercer array de tamaño 5 y rellénalo con la suma de los valores en la posición 0 del array bidimensional. Por ejemplo, tenemos un array de dos dimensiones {1,2,3,4,5},{5,4,3,2,1}, el tercer array debe ser la suma del array bidimensional: {1+5, 2+4, 3+3, 4+2, 5+1}

var matriz : [[Int]] = [[],[]];
var coaligado : [Int] = [];

for i in 0...4 {
    matriz[0].append(Int.random(in: 1...100));
    matriz[1].append(Int.random(in: 1...100));
}

for i in 0...matriz[0].count-1 {
    coaligado.append(matriz[0][i] + matriz[1][i]);
}

print("Ej 7: La matriz es \(matriz), y el array coaligado es \(coaligado)");

//8. Crear un array bidimensional de 6x6 y complétalo con los números que tú quieras. Imprime el array y la suma de cada una de sus filas.

var bidimensional : [[Int]] = [[],[],[],[],[],[]];

for (i, _) in bidimensional.enumerated() {
    for _ in 0...5 {
        bidimensional[i].append(Int.random(in: 1...100));
    }
}

print ("Ej 8: el array bidimensional es: \(bidimensional). Y las sumas de cada fila, por orden, son: ", terminator: "");

for i in bidimensional {
    print ("\(i.reduce(0, +))", terminator: " ");
}
print ("");

//9. Crea 3 arrays. Rellena los dos primeros con números aleatorios. Rellena el tercero de tal forma que la primera posición sea el resultado de multiplicar el primer elemento del array 1 con el primer elemento del array 2. Así sucesivamente hasta rellenar el tercer array.

var awwayA : [Int] = [];
var awwayB : [Int] = [];
var awwayMultiplicado : [Int] = [];

for i in 0...4 {
    awwayA.append(Int.random(in: 1...100));
    awwayB.append(Int.random(in: 1...100));
    awwayMultiplicado.append(awwayA[i] * awwayB[i]);
}

print ("Ej 9: los arrays originales son \(awwayA) y \(awwayB), mientras que el multiplicado es \(awwayMultiplicado).");

//10. (Opcional) Crea un array de 10 posiciones y rellénalo con números aleatorios. Recorre el array para saber cuántos números pares tiene. Después, crea otro array y llénalo sólo con los números pares que tenía el array anterior.

var array10posi : [Int] = [];
var array10posipares : [Int] = [];

for _ in 0...9 {
    array10posi.append(Int.random(in: 1...100));
}

for i in array10posi where i % 2 == 0 {
    array10posipares.append(i);
}

print ("Ej 10: el array original es \(array10posi), y sus numeros pares son \(array10posipares)");

//11. (Opcional) Crear un array bidimensional de 3x6 con los números que desees. Crea otro array de 6x3 y traspón el primero en el segundo. Es decir, si tenemos este de 2x3 {1, 3, 5} {2, 4, 6} debería quedar {1, 2} {3, 4} {5, 6}

var bidimensional3x6 : [[Int]] = [[],[],[]];
var bidimensional6x3 : [[Int]] = [[],[],[],[],[],[]];

for (i, _) in bidimensional3x6.enumerated() {
    for _ in 0...5 {
        bidimensional3x6[i].append(Int.random(in: 1...100));
    }
}

for valor in bidimensional3x6 {
    for (j, val) in valor.enumerated() {
        bidimensional6x3[j].append(val);
    }
}

print("Ej 11: el array 3x6 es \(bidimensional3x6), y el array 6x3 es \(bidimensional6x3).");
