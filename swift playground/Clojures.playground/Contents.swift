import UIKit

var funciones : [(Int) -> Int] = [ //Array de clojures
    {(num : Int) -> Int in return num * num}, //Paquete completo
    {(num : Int) -> Int in num * num}, //Omision de retorno
    {num in return num * num}, //Omision de tipo
    {num in num * num}, //Omision de tipo y retorno
    {$0 + 8} //Omision de retorno, tipo e inputs - Minima esencia!
]

let funSumar1 = { (numA : Int, numB : Int) -> Int in //forma de definir funciones anonimas con paquete completo
    return numA + numB
}

let funSumar2 = { //Omision de inputs, tipo y retorno - esto es lo mismo que la anterior clojure
    $0 + $1
}

// Trailing clojures

var constantes = [
    "A",
    "B",
    "C"
];

let ejemploA = constantes.sorted() {$0 > $1}; //Son lo mismo
let ejemploB = constantes.sorted {$0 > $1}; //Son lo mismo - ejemplo de trailing clojure

//Funciones de orden superior
//map, filter, reduce

//MAP
//la firma de map es asi: func map<T>(_ transform : (Element) -> T) -> [T]

let ejemplo = [Int](0...10);

let resultado = ejemplo.map { //Al ser una funcion unaria, solo tiene UN ELEMENTO - y esta usando trailing clojure
    $0 * $0 //Map va a pasar por todos los elementos de un array (o similar), y ejecutará la clojure con cada valor como input
};

//FILTER
//la firma es: func filter (_ isIncluded : (Element) -> Bool) -> [Element]
//le mete una clojure que devuelva un bool y, en base a eso, devuelve todos los elementos que hayan salido true

let numeros = [
    1, 2, 3, 10, 33, 22, 909
];

numeros.filter {$0 % 2 == 0} //Nota: tiene retorno, no modifica el original

//REDUCE
// func reduce<Result>(_ initialResult : Result, _ nextPartialResult: (Result, Element) -> Result) -> Result
// permite dar un unico resultado en base a todos los elementos de un array

numeros.reduce(0, +); //Le doy un valor inicial, y luego una funcion anonima. En este caso, operador suma, que es un tipo de funcion - pero no el unico

numeros.reduce(0) {$0 + $1}; //Esto y lo anterior son lo mismo

//GENERICOS

func intercambia<A, B> (_ tupla : (A, B)) -> (B, A) { //los genericos sirve para definir que tipos se van a usar. Pero no es como un any, en cada llamada se define el tipo
    return (tupla.1, tupla.0);
}
