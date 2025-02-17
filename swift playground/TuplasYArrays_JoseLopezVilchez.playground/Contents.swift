import UIKit

//1. Crear un array con 10 números aleatorios.

var array1 : [Int] = [];

for i in 0...9 {
    array1.append(Int.random(in: 1...100));
}

print ("Ej 1: \(array1)");

//2. Definir un array y almacenar en él los primeros 20 números pares. Imprimir el contenido del array.

var array2 : [Int] = [];

for i in 0...38 where i % 2 == 0 {
    array2.append(i);
}

print ("Ej 2: \(array2)");

//3. Usando el array del apartado 2, sumar 1 a los múltiplos de 4. Imprimir el contenido del array.

for (i, valor) in array2.enumerated() where valor % 4 == 0 {
    array2[i] += 1;
}

print ("Ej 3: \(array2)");

//4. Invertir el orden de los elementos del array del apartado 1.

array1.reverse();

print ("Ej 4: \(array1)");

//5. Obtener el valor máximo del array del apartado 1.

print ("Ej 5: \(array1.max() ?? 0)");

//6. Obtener el valor mínimo del array del apartado 1.

print ("Ej 6: \(array1.min() ?? 0)");

//7. Definir un nuevo array con 10 posiciones, rellenarlo con los valores del array del apartado 1 multiplicados por 2.

var array10pos : [Int] = [];

for valor in array1 {
    array10pos.append(valor*2);
}

print ("Ej 7: \(array10pos)");

//8. Declarar array "palabras"

var palabras : [String] = [];

print ("Ej 8: \(palabras)");

//9. Declara una tupla llamada "alumno" para almacenar nombre, puesto(entero), ciclo y curso

var alumno = (nombre: "Jojo", puesto: 30, ciclo: "blah", curso: 99);

print ("Ej 9: \(alumno)");

//10 y 11. Añade tu nombre y tu nº de puesto a la tupla

alumno.nombre = "Jose";
alumno.puesto = 5;

print ("Ej 10 y 11: \(alumno)");

//12. Asignar el curso y el ciclo

alumno.ciclo = "DAM";
alumno.curso = 2;

print ("Ej 12: \(alumno)");

//13. Imprime "Hola soy MiNombre, estoy en el puesto número X" utilizando los valores de la tupla

print ("Ej 13: Hola soy \(alumno.nombre), estoy en el puesto número \(alumno.puesto)");

//14. Guardar una palabra de la frase anterior en cada posición del array

var arrayFrase = "Hola soy \(alumno.nombre), estoy en el puesto número \(alumno.puesto)".split(separator: " ");

print ("Ej 14: \(arrayFrase)");

//15. Declara la tupla "coords" con 3 variables: x, y, z. Asignar los valores 20.0, 30.0 y 10.0, respectivamente.

var coords = (x: 20.0, y: 30.0, z: 10.0);

print ("Ej 15: \(coords)");

//16. Crear un array de tuplas con los datos de todos tus compañeros de clase

var arrayTuplas = [
    (nombre: "Alumno uno", curso: 2, ciclo: "DAM"),
    (nombre: "Alumno dos", curso: 2, ciclo: "DAM"),
    (nombre: "Alumno tres", curso: 2, ciclo: "DAM"),
    (nombre: "Alumno cuatro", curso: 2, ciclo: "DAM")
];

print ("Ej 16: \(arrayTuplas)");

//17. Imprime el nombre del alumno sentado en el puesto 3

print ("Ej 17: \(arrayTuplas[2].nombre)");

//(Opcionales) Programa un switch que imprima:
//18. "Punto 0" cuando la coordenada sea 0,0,0



//19. El eje cuya coordenada sea 0 (X, Y, o Z)



//20. La palabra "Centro" cuando el valor de los 3 ejes sean iguales



//21. Reemplazar el 5 por un 7 en este array: [6, 9, 3, 11, 5, 48]



//22. En el array anterior, reemplazar los valores 9, 3 y 11 por 9, 10, 11, 13 y 7



//23. Imprime todos los elementos del array en una misma línea separados por comas o espacios. Razonar la respuesta y explica las dificultades encontradas.



//27. Dado un array de números enteros con un tamaño de 5 posiciones con los siguientes valores {1,2,3,4,5}. Guardar los valores de este array en otro array pero con los valores invertidos, es decir, {5,4,3,2,1}.
                                                
