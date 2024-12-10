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
}

class Men: Person{
    
}

let andy = Men(age: 20, gender: "Marculino", color: "Branca", matrialStatus: "Casado")
print(andy.gender)
