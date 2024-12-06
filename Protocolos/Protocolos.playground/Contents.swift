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




/// Protocolo com inicializador
protocol SomeProtocol {
    init(someParameter: Int)  }

class SomeClass: SomeProtocol {
    required init(someParameter: Int) {
        //implementacao
    }
}


//Inicialziando com uma subclass
protocol AnotherProtocol {
    init()
}

class SomeSuperClass {
    init(){
        //Implementacao
    }
}

class SomeSubClass: SomeSuperClass, AnotherProtocol {
    required override init() {
        super.init()
    }
}


//Tipo completo, tipo existencial

protocol RandomNumberProtocol {
    func random() -> Double
}

class RandomNumber: RandomNumberProtocol{
    func random() -> Double {
        return Double.random(in: 1.0...100.9)
    }
}

class Dice {
    let sides: Int
    let generator: RandomNumberProtocol
    
    init(sides: Int, generator: RandomNumberProtocol) {
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var ramdom = Dice(sides: 6, generator: RandomNumber())
for _ in 1...5 {
    print("O lançamento de dados aleatorios é: \(ramdom.roll())")
}
