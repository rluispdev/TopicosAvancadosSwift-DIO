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

