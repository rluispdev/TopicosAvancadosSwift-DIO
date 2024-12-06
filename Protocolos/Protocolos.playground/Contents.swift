import UIKit

 
//Protocolo extension

protocol ExampleProtocol {
    var simpleDescription: String {get}
    mutating func adjust()
}

//Classe Assinando Protocol
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "Uma classe muito Simples"
    var antoherProperty: Int = 69105
    
    func adjust() {
    simpleDescription += "Agora 100% ajustado."
    }
}

var a = SimpleClass()
a.adjust()

let aDescription = a.simpleDescription


//Struct Assinando Protocol
struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "Uma classe muito Simples"
    
    mutating func adjust() {
        simpleDescription += "Agora 100% ajustado."
    }
}

var b = SimpleClass()
b.adjust()

let bDescription = a.simpleDescription
