 import UIKit

//Protocolos e Conformidades

protocol Bird : CustomStringConvertible {
    var name: String {get}
    var canFly: Bool {get}
}

protocol Flyable {
    var maximumSpeed: Double { get}
}

struct Parrot : Bird, Flyable {
    let name: String
    let amplitude: Double
    let frequency: Double
    let canFly: Bool = true
    
    var maximumSpeed: Double {
        3 * amplitude * frequency
    }
}

let parrot = Parrot(name: "Papagaio", amplitude: 3.0, frequency: 5.0)
print("O \(parrot.name) pode voar na velocidade de \(parrot.maximumSpeed) km/h")


struct Penguin: Bird {
    let name: String
    let canFly: Bool = false
}

let penguim = Penguin(name: "Pinguim")
print("O \(penguim.name) não pode voar.")

//Extensions de Protocolo


extension Bird {
    var canFly: Bool { self is Flyable }
   
}

struct Dove: Bird, Flyable {
    let name: String
    let amplitude: Double
    let frequency: Double
    var maximumSpeed: Double{
        3 * amplitude * frequency
    }
}


struct Ostrich: Bird {
    let name: String
}

let dove = Dove(name: "Pombo", amplitude: 14.0, frequency: 3.0)
print("O \(dove.name) pode voar na velocidade de \(dove.maximumSpeed) km/h")

let ostrich = Ostrich(name: "Ostrich")
print("O \(ostrich.name) não pode voar.")


enum Swallow : Bird, Flyable {
    case african
    case european
    case unknown
    
    var name: String {
        switch self {
            case .african:
                return "Andorinha Africana"
            case .european:
            return "Andorinha Europeia"
            case .unknown:
                return "Andorinha"
        }
    }
    
    var maximumSpeed: Double{
        switch self {
            case .african:
                return 10.0
            case .european:
                return 12.0
            case .unknown:
                fatalError("Velocidade de voo desconhecida.")
        }
    }
}

 //Comportamento padrão

extension Swallow {
    var canFly: Bool {
        self != .unknown
    }
}

Swallow.african.canFly
Swallow.european.canFly
Penguin.init(name: "Pinguim").canFly


//Usando bibliteca padrao do Swift - CustomStringConvertible

//Implementacao padrao
extension CustomStringConvertible where Self: Bird {
    var description: String {
        canFly ? "Pode voar" : "Não pode voar"
    }
}

print(Swallow.african)
print(Swallow.unknown)


// Adicionar conformidades

class Motorcycle {
    var name: String
    var speed: Double
    
    init(name: String) {
        self.name = name
        speed = 200.0
    }
}

protocol Racer {
    var speed: Double { get }
}

extension Parrot: Racer {
    var speed: Double {
        maximumSpeed
    }
}

extension Penguin: Racer {
    var speed: Double {
        34.0
    }
}

extension Swallow: Racer {
    var speed: Double {
        canFly ? maximumSpeed : 0.0
    }
}

extension Motorcycle : Racer {}

let racers: [Racer] = [
    Swallow.african,
    Swallow.european,
    Swallow.unknown,
    Penguin(name: "Pinguim"),
    Parrot (name: "Papagaio", amplitude: 3.0, frequency: 34.0),
    Motorcycle(name: "Tamara")
]

func topSpeed(of racers: [Racer]) -> Double {
    racers.max(by:  { $0.speed < $1.speed})?.speed ?? 0
}

print("Velocidade máxima dos pilotos \(topSpeed(of: racers)) ")

extension Sequence where Iterator.Element == Racer {
    func topSpeed() -> Double {
        self.max(by:  { $0.speed < $1.speed})?.speed ?? 0
    }
}
print("Velocidade máxima dos pilotos \(racers.topSpeed()) ")
print("Velocidade máxima entre os 3 primeiros pilotos \(racers[1...3].topSpeed()) ")



//Funcao que muda (mutating) um comportamento de um determinado objeto


protocol Cheat {
    mutating func boost(_ power: Double)
}

struct SwiftBird: Bird, Flyable {
  
    
    var name: String {"Swift \(version)"}
    let version: Double
    private var speedFactor = 1000.0
    
    init(version: Double) {
        self.version = version
    }
    
    var maximumSpeed: Double {
        version * speedFactor
    }
}


extension SwiftBird: Cheat {
    mutating func boost(_ power: Double) {
        speedFactor *= power
    }
}

var swiftBird = SwiftBird(version: 5.0)
print("Velocidade máxima do Swift  : \(swiftBird.maximumSpeed)")
swiftBird.boost(3.0)
print("Velocidade máxima do Swift  : \(swiftBird.maximumSpeed)")
swiftBird.boost(3.0)
print("Velocidade máxima do Swift  : \(swiftBird.maximumSpeed)")
