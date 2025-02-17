import UIKit

/*1. Escribir un programa que guarde en una variable el diccionario {'Euro':'€', 'Dollar':'$', 'Yen':'¥'}, a continuación crear una función que recibe el nombre de la divisa e imprime su símbolo en la consola. Si no existe la divisa en el diccionario, imprimirá un mensaje de error.*/

var diccionario : [String : String] = [
    "Euro" : "€",
    "Dollar" : "$",
    "Yen" : "¥"
];

func impresorSimbolo (nombreDivisa : String, diccionario : inout [String : String]) {
    print("Dado el nombre \(nombreDivisa), el simbolo es \(diccionario[nombreDivisa] ?? "DESCONOCIDO").");
}

//impresorSimbolo(nombreDivisa: "Yen", diccionario: &diccionario);
//impresorSimbolo(nombreDivisa: "Rublo", diccionario: &diccionario);

//2. Crear una función que añade una nueva divisa al diccionario. Deberá recibir como parámetros el nombre y el símbolo.
//3. Crear una función que permite modificar el símbolo de una divisa, recibiendo como parámetros el nombre y el nuevo símbolo.

func anyadirOModificarDivisa (nombreDivisa : String, simboloDivisa : String, diccionario : inout [String : String]) {
    diccionario[nombreDivisa] = simboloDivisa;
}

//anyadirOModificarDivisa(nombreDivisa: "Rublo", simboloDivisa: "₽", diccionario: &diccionario);
//impresorSimbolo(nombreDivisa: "Rublo", diccionario: &diccionario);

//4. Crear una función que recibe el nombre de una divisa y la elimina de la colección

func eliminarDivisa (nombreDivisa : String, diccionario : inout [String : String]) {
    print("Resultado de eliminacion: \(diccionario.removeValue(forKey: nombreDivisa) ?? "NO ELIMINADO")");
}

//5. Crear una función que devuelve el número de divisas que tenemos registradas en la colección.

func cuentaDivisas (diccionario : inout [String : String]) -> Int {
    return diccionario.count;
}

//6. Crear un diccionario que contenga nombres de personas como clave y sus edades como valor. Luego escribe una función que tome ese diccionario y un nombre como argumento y devuelva la edad de esa persona.

var personasedades = [
    "Paco" : 1,
    "Pepa" : 67,
    "Alpaca" : 12,
    "Longaniza" : 1000,
    "Matusalen" : 400,
    "Jordi Hurtado" : 99999,
    "Bae" : 27,
    "Womp Womp" : 5
];

func getEdad (nombrePersona : String, diccionario : inout [String : Int]) -> Int {
    return diccionario[nombrePersona] ?? -1;
}

//let nombre = "Jordi Hurtado";

//print("Dado el nombre \(nombre), si existe en el diccionario imprime su edad: \(getEdad(nombrePersona: nombre, diccionario: &personasedades) > 0 ? String(getEdad(nombrePersona: nombre, diccionario: &personasedades)) : "NO").");

//7. Escribe una función que actualice la edad de una persona en un diccionario dado su nombre. Si la persona no está en el diccionario, agrégala con la edad proporcionada.

func modificarEdad (nombrePersona : String, nuevaEdad : Int, diccionario : inout [String : Int]) {
    diccionario[nombrePersona] = nuevaEdad;
}

//8. Escribe una función que elimine a una persona del diccionario dada su clave (nombre).

func matar (nombrePersona : String, diccionario : inout [String : Int]) {
    diccionario.removeValue(forKey: nombrePersona);
}

//9. Crea una función que devuelva la cantidad de personas (pares clave-valor) en un diccionario.

func cuentaPersonas (diccionario : inout [String : Int]) -> Int {
    return diccionario.count;
}

//10. Escribe una función que imprima todos los nombres y edades del diccionario.

func impresoraDePersonas (diccionario : inout [String : Int]) {
    diccionario.forEach { (key, value) in
        print("\(key) : \(value), ");
    };
}

// impresoraDePersonas(diccionario: &personasedades);
