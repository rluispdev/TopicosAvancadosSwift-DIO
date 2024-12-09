import UIKit

 //Propriedades, métodos e inicializadores
class Person {
    
    var age: Int!
    var gender: String!
    var color: String!
    var moritalStatus: String!
    
}

class BehaviorPerson {
    var age: Int!
    var gender: String!
    var color: String!
    var moritalStatus: String!
    
    func play(sport: String!){
        //Instancia que a pessoa ira jogar.
    }
}

class Wall {
    init(){
        //excute a inicialização
        
    }
}


class WhiteWall {
    var length: Double
    
    init(){
        length = 5.5
        print("Criamos o objeto wall.")
        print("Length", length)
    }
}

//Criando um objeto Wall
var whiteWall = WhiteWall()

//Passando paramentros
 
class BlackWall {
    var length: Double
    init(length: Double){
        self.length = length
        print("Length", length)
    }
}

var blackWall = BlackWall(length: 10.5)

//Executar uma determinada acao

class LongWall{
    var length: Double
    var heigth: Double
    
    init(length: Double, height: Double) {
        self.length = length
        self.heigth = height
        print("A area é \(calculateArea())")
    }
    func calculateArea() -> Double {
        return length * heigth
    }
}

var longWall = LongWall(length: 20.5, height: 8.6)
var longWall2 = LongWall(length: 34.9, height: 78.0)

//Sobrecarga de Inicializadores

class PersonAge {
    var age: Int
    init() {
        age = 20
    }
    
    init(age: Int) {
        self.age = age
    }
    
    func getAge() -> Int {
        return age
    }
    
}

var personAge = PersonAge()
print("PersonAge: \(personAge.getAge())")

var personAge2 = PersonAge(age: 34)
print("PersonAge2 : \(personAge2.getAge())")


// Inicilizador de conveniencia

class University{
    var name: String
    var rank: String
    //Init primario
    init(name: String, rank: String) {
        self.name = name
        self.rank = rank
    }
    
//init secundario
    convenience init() {
        self.init(name: "Universidade Federal de Juiz de Fora", rank: "1º")
    }
}

var university = University()
print(university.name)


// Inicializador com falha.

class File {
    var folder: String
    
    init?(folder: String){
        if folder.isEmpty {
            print("Folder Not Found")
            return nil
        }
        self.folder = folder
    }
}

var file = File(folder: "")
if  file != nil {
    print("Arquivo encontrado com sucesso.")
}else {
    print("Erro o buscar o arquivo.")
}


// Inicializadores em Struct - Não obrigados

struct PersonStruct {
    var name: String
    var age: Int
    
}

var personStruct = PersonStruct(name: "Pedro", age: 23)
print("Nome:", personStruct.name, "| Idade:", personStruct.age)


