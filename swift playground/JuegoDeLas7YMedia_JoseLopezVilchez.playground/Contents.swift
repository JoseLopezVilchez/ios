import UIKit

//Este ejercicio está pensado para las cartas de la baraja española, que tiene 4 palos (bastos, copas, espadas y oros) y de cada palo hay 10 cartas (del 1 al 7, sota(10), caballo(11) y rey(12).

/*Crear una clase Carta (15 pts) con las siguientes:
 
 //Crear una enumeración Palo que represente los cuatro palos de la baraja. Deben tener un valor de tipo String (: String), de forma que su propiedad .rawValue sea una cadena y se pueda imprimir el nombre del palo. (5 pts)
 
-Propiedades: valor de tipo entero y palo de tipo Palo
-2 métodos:
 · inicializador (que recibirá un valor y un palo). Atención: el valor no puede ser menor que 1, ni mayor que 12, ni 8 ni 9. Deberá ser un inicializador failable.
 · descripcion: debe devolver un String con el nombre de la carta (ejemplo: El 1 de Bastos, el 12 de Oros)*/

class Carta : CustomStringConvertible {
    var description: String {
        return "\(self.conversionFiguras()) de \(self.palo)";
    }
    
    enum Palo : String, CaseIterable {
        case oros
        case bastos
        case espadas
        case copas
    }
    
    let valor : Int;
    let palo : Palo;
    
    init?(_ valor: Int, _ palo: Palo) {
        if (valor > 0 && valor < 13 && valor != 8 && valor != 9) {
            self.valor = valor;
            self.palo = palo;
        } else {
            return nil
        }
    }
    
    func conversionFiguras () -> String {
        switch (valor) {
        case 1: return "As";
        case 10: return "Sota";
        case 11: return "Caballo";
        case 12: return "Rey";
        default: return String(valor);
        }
    }
    
    /*func descripcion () {
        print("\(self.conversionFiguras()) de \(self.palo)");
    }*/
    
}

/*Crear una clase Mano: (15 pts)
-Propiedades: cartas, que es un array de Carta
-Propiedades calculadas: tamanio, la longitud del array
-Métodos:
 · Inicializador de la clase, que debe inicializar cartas como un array vacío.
 · addCarta: se le pasa una Carta y la añade a la mano
 · getCarta: se le pasa una posición (empezando por 0) y devuelve la Carta como un opcional. Si la posición es menor que 0 o mayor o igual que el tamaño, devolverá nil.*/

class Mano {
    private var cartas : [Carta];
    var tamanio : Int {
        get {
            return cartas.count;
        }
    }
    
    init() {
        self.cartas = [];
    }
    
    func addCarta (_ carta : Carta) {self.cartas.append(carta)}
    
    func getCarta (pos : Int) -> Carta? {(pos < 0 || pos >= self.tamanio) ? nil : self.cartas.remove(at: pos)}
    
    func getValorTotal () -> Double {
        var valor = 0.0;
        
        for carta in cartas {
            switch carta.valor {
            case 10: valor += 0.5;
            case 11: valor += 0.5;
            case 12: valor += 0.5;
            default: valor += Double(carta.valor);
            }
        }
        
        return valor;
    }
    
    func mostrarCartas () -> [Carta] {
        return cartas;
    }
}

//Para comprobar el funcionamiento de las clases se puede utilizar este código. Si todo está correcto, deberían aparecer en pantalla las tres cartas añadidas a la mano.

var mano = Mano()
mano.addCarta(Carta(1, .oros)!)
mano.addCarta(Carta(10, .espadas)!)
mano.addCarta(Carta(7, .copas)!)
print("Hay \(mano.tamanio) cartas")
for num in 0..<mano.tamanio {
  if let carta = mano.getCarta(pos:num) {
      print(carta.description)

  }
}

/*Crear la clase Baraja (15 pts). Del 1 al 12 de los cuatro palos, menos 8 y 9:
-Propiedades: cartas, un array de Carta
- Métodos:
 · init() que debe rellenar el array de cartas con todas las cartas de la baraja.
 · repartirCarta() devuelve la última carta de la baraja y la elimina de ella. Se puede utilizar el método de la clase Array popLast().
 · barajar() debe cambiar al azar el orden de las cartas en el array. Se puede utilizar el método shuffle() del Array*/

class Baraja {
    
    private var cartas : [Carta];
    
    init() {
        var insertado : [Carta] = [];
        
        for palo in Carta.Palo.allCases {
            for i in 1...12 where i != 8 && i != 9 {
                insertado.append(Carta(i, palo)!);
            }
        }
        
        self.cartas = insertado;
    }
    
    func repartirCarta () -> Carta {cartas.popLast()!}
    
    func recibirCarta (carta : Carta) {cartas.append(carta)}
    
    func barajar () {cartas.shuffle()}
}

/*Implementar la clase Juego: (30 pts)
 
 //Implementar la enumeración EstadoJuego (5 pts) con 5 elementos: turnoJugador, ganaJugador, pierdeJugador, empate, noIniciado
 
- Propiedades:
 · baraja, de tipo Baraja
 · manoJugador, de tipo Mano
 · estado de tipo EstadoJuego
 · jugadaMaquina de tipo Double
 
-Métodos
 · inicializador, que inicializa el juego con estado a .noIniciado
 · comenzarPartida, debe crear una baraja, barajar las cartas, inicializar la mano del jugador y hacer la jugada de la máquina (la máquina no pedirá más cartas cuando pase de 4)(*)
 · jugadorPideCarta: imprime una carta y la añade a la mano del jugador
 · jugadorSePlanta: acabar partida
· private func acabarPartida() {
//todo: sumar el valor de las cartas del jugador
//todo: calcular quién gana, en función de esta suma y la jugada de la máquina
//todo: cambiar el estado del juego al valor apropiado e imprimir un mensaje*/
//(Hacer la jugada de la máquina de tipo Mano: 10 pts. Pedirá cartas hasta que su mano tenga un valor de 4 o más)

class Juego {
    
    enum EstadoJuego {
        case turnoJugador
        case ganaJugador
        case pierdeJugador
        case empate
        case noIniciado
    }
    
    private var baraja : Baraja;
    private var manoJugador : Mano;
    private var estado : EstadoJuego;
    private var manoMaquina : Mano;
    
    init() {
        self.estado = .noIniciado;
        self.baraja = Baraja();
        self.manoJugador = Mano();
        self.manoMaquina = Mano();
    }
    
    func comenzarPartida () {
        
        print ("Inicio de partida");
        
        while manoJugador.tamanio > 0 {
            baraja.recibirCarta(carta: manoJugador.getCarta(pos: manoJugador.tamanio)!);
        }
        
        while manoMaquina.tamanio > 0 {
            baraja.recibirCarta(carta: manoMaquina.getCarta(pos: manoMaquina.tamanio)!);
        }
        
        self.baraja.barajar();
        
        while manoMaquina.getValorTotal() < 4 {
            manoMaquina.addCarta(baraja.repartirCarta());
        }
        
        self.estado = .turnoJugador;
    }
    
    func jugadorPideCarta () -> Double {
        let carta = baraja.repartirCarta();
        print ("El jugador ha cogido un \(carta.description)");
        self.manoJugador.addCarta(carta);
        return manoJugador.getValorTotal();
    }
    
    func jugadorSePlanta () { //No merece la pena hacer una funcion para acabarPartida si en cuanto se planta el jugador acaba igualmente
        if (manoJugador.getValorTotal() == manoMaquina.getValorTotal() || (manoJugador.getValorTotal() > 7.5 && manoMaquina.getValorTotal() > 7.5)) {
            self.estado = .empate
            print("Empate! El jugador tenia \(manoJugador.mostrarCartas().reduce("") {"\($0) \($1),"}) y la maquina tenia \(manoMaquina.mostrarCartas().reduce("") {"\($0) \($1),"}).");
        } else if ((manoJugador.getValorTotal() > manoMaquina.getValorTotal() || manoMaquina.getValorTotal() > 7.5) && manoJugador.getValorTotal() <= 7.5) {
            self.estado = .ganaJugador
            print("Gana el jugador con \(manoJugador.getValorTotal()) puntos, comparados con los \(manoMaquina.getValorTotal()) puntos de la maquina. La mano del jugador era \(manoJugador.mostrarCartas().reduce("") {"\($0) \($1),"}) y la de la maquina era \(manoMaquina.mostrarCartas().reduce("") {"\($0) \($1),"}).");
        } else {
            self.estado = .pierdeJugador
            print("Gana la maquina con \(manoMaquina.getValorTotal()) puntos, comparados con los \(manoJugador.getValorTotal()) puntos del jugador. La mano del jugador era \(manoJugador.mostrarCartas().reduce("") {"\($0) \($1),"}) y la de la maquina era \(manoMaquina.mostrarCartas().reduce("") {"\($0) \($1),"})");
        }
    }
    
    
}

//Iterar en los casos de un enum: https://www.simpleswiftguide.com/how-to-iterate-over-enum-cases-in-swift/

//Crear un método que inicia una partida en la que el jugador pide 3 cartas y la máquina hace su jugada. Deberán imprimirse las cartas obtenidas por el jugador, la jugada de la máquina y el resultado de la partida. (10 pts)

func partidaDefecto () {
    let juego = Juego();
    
    juego.comenzarPartida();
    
    juego.jugadorPideCarta();
    juego.jugadorPideCarta();
    juego.jugadorPideCarta();
    
    juego.jugadorSePlanta();
}

partidaDefecto();

func partidaMejor () { //Esta funcion hace que el jugador siga el mismo patron que sigue la maquina
    let juego = Juego();
    
    juego.comenzarPartida();
    
    while juego.jugadorPideCarta() < 4 {}
    
    juego.jugadorSePlanta();
}

partidaMejor();
