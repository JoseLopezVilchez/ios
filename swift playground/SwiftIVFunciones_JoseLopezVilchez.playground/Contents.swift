import UIKit

//1. Crear una función que devuelva true o false según el número recibido sea par o no

func evenChecker (numero : Int) -> Bool {
    return numero % 2 == 0;
}

let comprobador1 = Int.random(in: 1...100);
print("Ej 1: Usando \(comprobador1) como input, sale: \(evenChecker(numero: comprobador1)).");

//2. Dados dos números, comprobar si el primero es divisible entre el segundo. Para ello, crear una función que devuelve true si lo es, no en caso contrario.

func isDivisible (numero: Int, divisor: Int) -> Bool {
    return numero % divisor == 0;
}

let comprobador2 = (Int.random(in: 1...100) , Int.random(in: 1...100));
print("Ej 2: Usando \(comprobador2) como input, sale: \(isDivisible(numero: comprobador2.0, divisor: comprobador2.1)).");

//3. Dada una cantidad determinada de chicos y chicas, calcular el porcentaje de cada uno respecto al total. La función debe recibir un parámetro de tipo tupla y devolver los porcentajes en otra tupla

func genderGap (tuplaGeneros: (numChicos: Int, numChicas: Int)) -> ((percentChicos: Int, percentChicas: Int)) {
    let total = Float(tuplaGeneros.numChicas + tuplaGeneros.numChicos);
    let percentChicos = Int((Float(tuplaGeneros.numChicos)/total)*100);
    let percentChicas = Int((Float(tuplaGeneros.numChicas)/total)*100);
    
    return (percentChicos: percentChicos, percentChicas: percentChicas);
}

let comprobador3 = (Int.random(in: 1...100), Int.random(in: 1...100));
print("Ej 3: Usando \(comprobador3) como input, sale: chicos \(genderGap(tuplaGeneros: comprobador3).percentChicos)%, chicas \(genderGap(tuplaGeneros: comprobador3).percentChicas)%.");

//4. Crear una función que recibe 2 tuplas (Int,Int). Cada tupla representa una fracción (numerador, denominador). La función debe devolver la suma de las dos fracciones

func sumaFraccion (fraccion1: (numerador: Int, denominador: Int), fraccion2: (numerador: Int, denominador: Int)) -> Double {
    let frac1 = Double(fraccion1.numerador) / Double(fraccion1.denominador);
    let frac2 = Double(fraccion2.numerador) / Double(fraccion2.denominador);
    return frac1 + frac2;
}

let comprobador4 = ((Int.random(in: 1...100), Int.random(in: 1...100)), (Int.random(in: 1...100), Int.random(in: 1...100)));
print("Ej 4: Usando \(comprobador4) como input, sale: \(sumaFraccion(fraccion1: comprobador4.0, fraccion2: comprobador4.1)).");

//5. (opcional) Crear una función que recibe un número indeterminado de tuplas. Cada tupla representa una fracción (numerador, denomidador). La función debe devolver la suma de todas las fracciones en otra tupla.

func sumaMultiFraccion (fracciones: (numerador: Int, denominador: Int)...) -> Double {
    var retorno : Double = 0;
    
    for fraccion in fracciones {
        retorno += Double(fraccion.numerador) / Double(fraccion.denominador);
    }
    
    return retorno;
}

let comprobador5 : [(Int, Int)] = [(Int.random(in: 1...100), Int.random(in: 1...100)), (Int.random(in: 1...100), Int.random(in: 1...100)), (Int.random(in: 1...100), Int.random(in: 1...100)), (Int.random(in: 1...100), Int.random(in: 1...100)), (Int.random(in: 1...100), Int.random(in: 1...100))];
print("Ej 5: Usando \(comprobador5) como input, sale: \(sumaMultiFraccion(fracciones: comprobador5[0], comprobador5[1], comprobador5[2], comprobador5[3], comprobador5[4])).");

//6. Desarrollar una función para comprobar si un año es bisiesto:

func comprobadorBisiesto (anyo: Int) -> Bool {
    return anyo % 400 == 0 || (anyo % 4 == 0 && anyo % 100 != 0);
}

let comprobador6 = Int.random(in: 1...100);
print("Ej 6: Usando \(comprobador6) como input, sale: \(comprobadorBisiesto(anyo: comprobador6)).");

//7. Escribir una función llamada “saluda”, que recibe un nombre y devuelve la frase “Hola + nombre”. Llamar a la función e imprimir la respuesta.

func saluda (nombre : String) -> String {
    return "Hola \(nombre)";
}

let comprobador7 = "Poyo! :D";
print ("Ej 7: Usando \(comprobador7) como input, sale: \(saluda(nombre: comprobador7)).");

//8. Crear una función que recibe un número de años y devuelve el número de segundos que forman esa cantidad de años.

func segundosDeAnyos (anyos: Int) -> Int {
    return anyos * 365 * 24 * 60 * 60;
}

let comprobador8 = Int.random(in: 1...100);
print("Ej 8: Usando \(comprobador8) como input, sale: \(segundosDeAnyos(anyos: comprobador8)).");

//9. Implementar una función que intercambia el valor de dos variables de tipo Int

func swap (variables: inout (primerInt: Int, segundoInt: Int)) {
    let apoyo = variables.primerInt;
    variables.primerInt = variables.segundoInt;
    variables.segundoInt = apoyo;
}

var comprobador9 = (primerInt: Int.random(in: 1...100), segundoInt: Int.random(in: 1...100));
print ("Ej 9: Usando \(comprobador9) como input, ", terminator: "");
swap(variables: &comprobador9);
print("sale: \(comprobador9).");

//10. Crear una función que recibe un número entero (sin necesidad de escribir la etiqueta del parámetro) e imprime el último dígito.

func ultimoDigito (_ numero: Int) -> Int {
    return numero % 10;
}

let comprobador10 = Int.random(in: 1...10000);
print("Ej 10: Usando \(comprobador10) como input, sale: \(ultimoDigito(comprobador10)).");

//11. Escribe una función que tome dos sets de números enteros y devuelva un nuevo set que contenga la unión de ambos sets (sin duplicados).

func uneSets (setA: Set<Int>, setB: Set<Int>) -> Set<Int> {
    return setA.union(setB.subtracting(setA));
}

let comprobador11 : (Set<Int>, Set<Int>) = (
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
    [5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
);
print("Ej 11: Usando \(comprobador11) como input, sale: \(uneSets(setA: comprobador11.0, setB: comprobador11.1)).");
