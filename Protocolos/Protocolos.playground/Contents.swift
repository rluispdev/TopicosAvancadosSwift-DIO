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


//Parte 2

//Usar protocolos como Delegate

protocol DiceGame {
    var dice: Dice { get }
    func play()
}

protocol DiceGameDelegate: AnyObject {
    ///Iniciar
    func gameDidStart(_ game: DiceGame)
    ///Jogar
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    ///Finaizar o jogo
    func gameDidEnd(_ game: DiceGame)
}

//Weak para marcar uma referencia fraca
class Game {
    weak var diceGame: DiceGameDelegate?
}

//MARK: Extension


class SomeType {
    var number: Int = 7
    
}


extension SomeType {
    //Muda ou adicona novas funcionalidades
}


extension SomeType: ExampleProtocol {
    var simpleDescription: String {
        return "O numero \( number)"
    }
    
    func adjust() {
        number += 42
    }
}

var someType = SomeType()
print(someType.simpleDescription)


//Adicionar propriedades computadas a tipos existentes

extension Double {
    
    var km: Double {return self * 1_000.0 }
    var m: Double {return self }
    var cm: Double {return self / 100.0}
    var mm: Double { return self / 1_000.0}
    var ft: Double { return self / 3.28084}
}

let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")

//Adicionar novos incializadores a tipos existentes

struct Size {
    var width = 0.0, heigth = 0.0
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
}
///Inicializando com inicializador padrao
let defautRect = Rect()
///Inicializando com inicializadores proprios
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, heigth: 5.0))


///Criando inicialiadores personalizados

extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let orginY = center.y - (size.heigth / 2)
        self.init(origin: Point( x: originX, y: orginY), size: size)
    }
}


let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, heigth: 3.0))


///Protocolos 3

//Metodos em extensions

extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}
3.repetitions {
    print("Hello")
}

///Usando um metodo mutating

extension Int {
    mutating func square() {
        self = self * self
    }
}

var someInt = 3
someInt.square()


//Adicionar subscriptions a um tipo existente.


extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

746381295[0]
746381295[1]
746381295[2]
746381295[8]

// Tipo Aninhado

extension Int {
    enum Kind {
        case negative, zero, positive
    }
    
    var kind: Kind {
        switch self {
            case 0:
                return .zero
            case let x where x > 0 :
                return .positive
            default:
                return .negative
        }
    }
}

10.kind


///Valiadando  a  Extension INT

func printIntegerKinds(_ numbers: [Int]) {
    for number in numbers {
        switch number.kind {
            case .negative:
                print("- ", terminator: "")
            case .zero:
                print("0 ", terminator: "")
            case .positive:
                print("+ ", terminator: "")
        }
    }
    
    print("")
}


printIntegerKinds([3, 19, -27, 0, -6, 0, 7])
