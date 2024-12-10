import UIKit

//Herança

class Person {
    
    var age: Int
    var gender: String
    var color: String
    var matrialStatus: String
    
    init(age: Int, gender: String, color: String, matrialStatus: String) {
        self.age = age
        self.gender = gender
        self.color = color
        self.matrialStatus = matrialStatus
        
    }
    
    func play(sport: String){
        print("Esportes\(sport)")
    }
    
    //Sobrecarga de método
    func play(instrument: String) {
        print("Instrumento: \(instrument)")
    }
}

class Men: Person{
    
}

let andy = Men(age: 20, gender: "Masculino", color: "Branca", matrialStatus: "Casado")
print(andy.gender)


//Substituicao de metodo - override

class FootballPlayer: Person {
    override func play(sport: String) {
        print("Jogador de \(sport)")
    }
}
let footballPlayer = FootballPlayer(age: 31, gender: "masculino", color: "parda", matrialStatus: "solteiro")
footballPlayer.play(sport: "Futebol")

class Pilot: Person {
    override func play(sport: String){
        print("Piloto de \(sport)")
    }
}

let pilot = Pilot(age: 22, gender: "Masculino", color: "Negra", matrialStatus: "solteiro")
pilot.play(sport: "Aviao")


class Rock: Person {
    override func play(instrument: String){
        print("Toca \(instrument)")
    }
}

let rock = Rock(age: 34, gender: "Masculino", color: "Branco", matrialStatus: "solteiro")
rock.play(instrument: "guitarra")
