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
