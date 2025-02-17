import UIKit

//Utiliza el método filter para obtener todos los nombre de personas que se encuentran en un array llamado nombres y que comiencen por la letra «A»:
let nombres = ["Ana", "Juan", "Pepe", "Anastasio", "Ángel"]
let nombresConA = nombres.filter { $0.first == "A" || $0.first == "Á" }
print("Los siguientes nombres comienzan por 'A': \(nombresConA)")


//Obtener la suma de los elementos del array números
let numeros = [1, 2, 3, 4, 6, 8, 9, 3, 12, 11]
let suma = numeros.reduce(0, {$0 + $1})
print("La suma de los números \(numeros) es \(suma)")

//Utilizando el método map calcula el número real que se obtiene al dividir el numerador entre el denominador de diversas fracciones que se encuentran almacenadas en un array de tuplas, e imprime el resultado:
let fracciones = [(1,2), (2, 3), (5, 1), (4, 7)]
let reales = fracciones.map {Double($0.0) / Double($0.1)}
print("De las fracciones \(fracciones) se obtienen los números reales \(reales)")

//Utilizando el método sorted, ordena ascendentemente todos los enteros de un array:
let numeros2 = [1, 6, 3, 34, 6, 8, 9, 3, 12, 11]
let numerosOrdenados = numeros2.sorted(by: <)
print(numerosOrdenados)

//Definir una clase libro que tenga dos propiedades: titulo y paginas. A continuación crear un array de libros con diferentes títulos y páginas, y ordenar los libros por el título de manera ascendente utilizando el método sorted. Finalmente se deberá mostrar el resultado por pantalla:
class Libro {
var titulo = ""
var paginas = 0
init(_ titulo:String, _ paginas:Int) {
self.titulo = titulo
self.paginas = paginas
}
}
var libros = [Libro("Juego de tronos", 250), Libro("El principito", 100), Libro("Blancanieves", 130)]
let librosOrdenados = libros.sorted(by: {$0.titulo < $1.titulo})
print("Libros ordenados por titulo:")
for libro in librosOrdenados {
print(libro.titulo)
}

//1. Utiliza el método filter para crear un array llamado múltiplos que contenga todos los múltiplos de 3 de un array de enteros que se llame numeros e imprímelo para comprobar el resultado:

print("Ej 1: en base a \(numeros), los multiplos de 3 son \(numeros.filter() {$0 % 3 == 0})");

//2. Utilizando el método reduce, encuentra el número más grande de entre los enteros de un array que se llame numeros e imprímelo:

print("Ej 2: en base a \(numeros), el numero mas grande seria \(numeros.reduce(numeros[0]){$0 > $1 ? $0 : $1})");

//3. Utilizando el método reduce, une todas las cadenas de un array en una sola añadiendo espacios entre cada una de ellas, e imprime el resultado:

print("Ej 3: en base a \(nombres), el string en conjunto seria \(nombres.reduce("") {"\($0) \($1)"})");

//4. Utilizando el método filter sobre un array que contiene los nombres de varias personas, muestra sólo aquellos cuyo nombre tiene más de 5 letras:

print("Ej 4: en base a \(nombres), los nombres con mas de 5 letras son \(nombres.filter() {$0.count > 5})");

//5. Utilizando el método reduce, calcula la suma de todos los enteros de un array, y a continuación calcula la media e imprime el resultado:

let resultado5 = numeros.reduce(0, +);

print("Ej 5: en base a \(numeros), la suma de todos es \(resultado5), y la media es \(resultado5/numeros.count).");

//6. Utilizando el método map convierte a minúsculas todas las cadenas almacenadas en un array, e imprime el resultado:

print("Ej 6: en base a \(nombres), pasado a minusculas es \(nombres.map() {$0.lowercased()}).");

//7. Utilizando el método map obtén un array con el número de letras que tienen cada una de las cadenas de otro array, e imprime el resultado:

print("Ej 7: en base a \(nombres), sus numeros de letras son \(nombres.map() {$0.count}).");

//8. Utilizando el método sorted, ordena descendentemente todos los enteros de un array:

print("Ej 8: en base a \(numeros), cuando son ordenados descendentemente sale \(numeros.sorted(by: >)).");

//9. Utilizando el método sorted, ordena ascendentemente todos los nombres de personas que se encuentran almacenados en un array:

print("Ej 9: en base a \(numeros), cuando son ordenados ascendentemente sale \(numeros.sorted(by: <)).");

//10. Crear un array de libros con diferentes autores, títulos y páginas, y ordenar los libros por el número de páginas de manera ascendente y descendente utilizando el método sorted, mostrando finalmente el resultado:

let libros10 : [(autor : String, titulo : String, paginas : Int)] = [
    ("Nietzsche", "El Anticristo", 190),
    ("El Arte de la Guerra", "Sun Tzu", 100),
    ("El Principe", "Niccolo Machiavelli", 230),
    ("El Lazarillo de Tormes", "Anonimo", 200),
    ("Los Pilares de la Tierra", "Ken Follet", 9999)
]

print("Ej 10: dados los libros \(libros10), ordenados por numero de paginas de forma ascendente son \(libros10.sorted() {$0.paginas < $1.paginas}), y de forma descendente son \(libros10.sorted() {$0.paginas > $1.paginas}).");
