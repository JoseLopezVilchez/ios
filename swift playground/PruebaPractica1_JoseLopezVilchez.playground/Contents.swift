import UIKit


//1. Crear una clase ListaDeLaCompra con una propiedad lista de tipo Diccionario<String, Float>. Esta propiedad almacenará los nombres de los artículos y el precio de cada uno de ellos. (10 pts)

class ListaDeLaCompra {
    private var lista : [String : Float] = [:];
    
    /*2. Añadir dos variables calculadas (10 pts):
         · vacia, de tipo Bool, que indica si la lista está vacía o no
         · articulos, de tipo Int, que devuelve el número de artículos que hay en la lista.*/
    
    var vacia : Bool {
        get {
            return lista.isEmpty;
        }
    }
    
    var articulos : Int {
        get {
            return lista.count;
        }
    }
    
    //3. Implementar un método para añadir artículos a la lista. Si ya existe, no debe añadirlo, si no imprimir un mensaje de error (10 pts)
    
    func anyadirArticulo (nombre : String, precio : Float) { //Testeado
        if (lista[nombre.lowercased()] == nil) {
            lista[nombre.lowercased()] = precio;
        } else {
            print ("Error: el articulo \(nombre) ya existe. No se aplicaron cambios.");
        }
    }
    
    //4. Implementar un método para eliminar artículos de la lista. (10 pts)
    
    func eliminarArticulo (nombre : String) { //Testeado
        if (lista[nombre.lowercased()] != nil) {
            lista.removeValue(forKey: nombre.lowercased());
        } else {
            print ("Error: el articulo \(nombre) no ha sido encontrado, ergo no pudo ser eliminado.");
        }
    }
    
    //5. Añadir una variable calculada que devuelve el importe total de la lista de la compra. (15 pts)
    
    var importeTotal : Float { //Testeado
        get {
            return lista.reduce(0.0, {$0 + $1.value})
        }
    }
    
    //6. Implementar un método que permite modificar el precio de un producto. (15 pts)
    
    func modificarPrecio (nombre : String, precio : Float) { //Testeado
        if (lista[nombre.lowercased()] != nil) {
            lista[nombre.lowercased()] = precio;
        } else {
            print ("Error: el articulo \(nombre) no ha sido encontrado, ergo su precio no pudo ser modificado.");
        }
    }
    
    /*7. Implementar un método que imprime el nombre de todos los artículos que hay en la lista y su precio entre paréntesis. (15 pts)
         Ejemplo: Mantequilla (1,45€)*/
    
    func imprimirArticulos () {
        for (key, value) in lista {
            print ("\(key) (\(value)€)");
        }
    }
    
    /*8. Modificar el método del punto 7 para que reciba un parámetro de tipo bool llamado "porPrecio". Por defecto tendrá valor false y,
    cuando sea true imprimirá los artículos ordenados por precio, de menor a mayor. (15 pts)*/
    
    func imprimirArticulos (porPrecio : Bool?) { //Testeado
        if (porPrecio ?? false) {
            for (key, value) in lista.sorted(by: {$0.value < $1.value}) {
                print ("\(key) (\(value)€)");
            }
        } else {
            for (key, value) in lista {
                print ("\(key) (\(value)€)");
            }
        }
    }
}

//9. Escribir el código para probar el funcionamiento, que realice estas funciones:

//· Crear una instancia de ListaDeLaCompra
let lista = ListaDeLaCompra();

//· Añadir lentejas (1,89€) y leche (0,82€)
lista.anyadirArticulo(nombre: "lentejas", precio: 1.89);
lista.anyadirArticulo(nombre: "leche", precio: 0.82);

//· Cambiar el precio de las lentejas a 1,93€
lista.modificarPrecio(nombre: "lentejas", precio: 1.93);

//· Cambiar el precio de las manzanas a 1,99€
lista.modificarPrecio(nombre: "manzanas", precio: 1.99);

//· Añadir chocolate (1,80€)
lista.anyadirArticulo(nombre: "CHOCOLATE", precio: 1.80);

//· Cambiar el precio del chocolate a 1,85€
lista.modificarPrecio(nombre: "chocolate", precio: 1.85);

//· Eliminar la leche
lista.eliminarArticulo(nombre: "LECHE");

//· Imprimir la lista de la compra completa ordenada por precio, utilizando el método del apartado 8
lista.imprimirArticulos(porPrecio: true);

//· Imprimir el precio total de la lista
print ("El importe total es: \(lista.importeTotal)€.");

//Es requisito necesario para la corrección del trabajo que el código compile y escribir el código del punto 9 para que se muestren los resultados solicitados.

//EXTRA: testing propio para ver si todo va bien

print ("--------- Testing propio ----------");

lista.anyadirArticulo(nombre: "lentejas", precio: 1.89); //No deberia dejar

lista.modificarPrecio(nombre: "lentejas", precio: 1.0); //Cambio precios para luego poder comprobar la suma sin tener que tirar de cabeza
lista.modificarPrecio(nombre: "CHOCOLATE", precio: 1.0);

lista.eliminarArticulo(nombre: "apple"); //No deberia dejar

lista.anyadirArticulo(nombre: "a", precio: 2.0); //meto articulos extra para comprobar mejor aun el orden
lista.anyadirArticulo(nombre: "b", precio: 3.0);

print ("El importe total es: \(lista.importeTotal)€.");

lista.imprimirArticulos(porPrecio: true);
print ("-------------------");
lista.imprimirArticulos(porPrecio: false);
print ("-------------------");
lista.imprimirArticulos(porPrecio: nil);
print ("-------------------");
lista.imprimirArticulos();
