import UIKit

//1. Escribir un closure que imprima la palabra “cosa” y asigne el closure a una variable. Llama al closure

let ej1 = {print("Ej 1: Cosa")};

ej1();

//2. Escribe un closure que reciba 2 enteros y devuelva la suma de los dos. Asigna el closure a una variable y llámalo.
//3. (Opcional) Escribe este closure de forma diferente
//4. (Opcional) De otra forma diferente a las anteriores

var ej23y4 : (Int, Int) -> Int = {$0 + $1}; //Primera forma de escribirlo (superreducida)

ej23y4 = { (a , b) in //otra forma de escribirlo
    a + b
}

ej23y4 = { (a : Int, b : Int) in //otra forma de escribirlo
    print("Ej 2, 3 y 4: la suma de \(a) y \(b) es \(a + b)");
    return a + b;
}

ej23y4(2, 5);

//5. Escribe un closure que devuelva el cuadrado de la entrada. Escribe el closure completo y llámalo directamente desde dentro del paréntesis de print.
//6. Escribe el closure anterior de una forma diferente
//7. (opcional) Escríbelo de otra forma diferente
//8. (opcional) Escríbelo de otra forma diferente a las anteriores

var ej567y8 : (Int) -> Int = {$0*$0};
ej567y8 = {(a) in a*a};
ej567y8 = {(a) in return a*a};
ej567y8 = {(a : Int) in a*a};

print ("Ej 5, 6, 7 y 8: el cuadrado de 5 es \(ej567y8(5))");

//9. Ordena este array con un closure utilizado: sorted(by: )
//10. (opcional) Escríbelo de otra forma (nota: se puede llamar a sorted sin by:)
//11. (opcional) Escríbelo de otra forma
let numeros = [23, 4, 36, 25, 23, 46]

var ej910y11 = numeros.sorted (by : >);
ej910y11 = numeros.sorted() {$0 > $1};
ej910y11 = numeros.sorted {$0 > $1};

print ("Ej 9, 10 y 11: dado el array \(numeros), tras aplicar 'sorted' sale \(ej910y11).");

//12. (opcional) Escribe un closure que devuelva 3581, sin asignar el closure a una variable. Llámalo inmediatamente e ignora el valor que devuelve el closure (Pista: la solución, sin contar los espacios, son 10 caracteres)

do {{3581}()} //No he podido hacerlo con 10, solo 12

print ("Ej 12: imprimiendo \({3581}())."); //Imprimo por hacer la demostracion
