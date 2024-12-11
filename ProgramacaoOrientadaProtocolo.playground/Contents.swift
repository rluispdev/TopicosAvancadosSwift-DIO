 import UIKit

//Protocolos e Conformidades

protocol Bird {
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
    case eropean
    case unknown
    
    var name: String {
        switch self {
            case .african:
                return "Andorinha Africana"
            case .eropean:
            return "Andorinha Europeia"
            case .unknown:
                return "Andorinha"
        }
    }
    
    var maximumSpeed: Double{
        switch self {
            case .african:
                return 10.0
            case .eropean:
                return 12.0
            case .unknown:
                fatalError("Velocidade de voo desconhecida.")
        }
    }
}

 
