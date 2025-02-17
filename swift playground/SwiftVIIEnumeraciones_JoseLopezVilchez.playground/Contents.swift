import UIKit

//1. Crear una enumeración para los tipos de usuario llamada “UserType”: admin, editor, author, reader

enum UserType {
    case admin
    case editor
    case author
    case reader
}

//2. Crear una estructura llamada “User” con una variable de sólo lectura llamada “type”. Inicialízala a .admin
//3. (opcional) añadir una propiedad para el nombre de usuario
//4. Implementa una función que recibe un User e imprime en consola el tipo de usuario.
//6. (opcional) imprimir un saludo al crear un usuario usuario.

struct User {
    private var tipo = UserType.admin;
    var type : UserType {
        return tipo;
    }
    
    var nombre : String;
    
    init(nombre: String) {
        self.nombre = nombre;
        print("Saludos \(nombre)");
    }
    
    static func readUserType (usuario : User) {
        print("El tipo de \(usuario.nombre) es: \(usuario.type).");
    }
}

//5. Comprueba el tipo de usuario de User

let usuario = User(nombre: "Estrujencio");
User.readUserType(usuario: usuario);
