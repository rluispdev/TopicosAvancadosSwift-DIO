import UIKit

//Encapsulamento

/*
 Controle de Acessos

 Open - Menos restrito.
 Public - Semelhante ao Open, porém com algumas diferenças.
 Internal - Permite o acesso de qualquer lugar no módulo, mas não fora dele.
 File-private - Permite o uso dentro do arquivo.
 Private - Nível mais restritivo de todos.
 */


class Maths {
    let a: Int!
    let b: Int!
    
    //Encapsulado
    private var result: Int?
    
    init(a: Int, b: Int){
        self.a = a
        self.b = b
    }
    
    func add() {
        result = a + b
    }
    
    func displayResult() {
        print("Result = \(result ?? 0)")
    }
}

let calculation = Maths(a: 10, b: 20)
calculation.add()
calculation.displayResult()


//Open

open class OpenClass {
    open var age: Int = 23
    open func play(sport: String){}
}

//Nao permite que o comportameto seja herdado
public class PublicClass {
    public var age: Int = 23
    public func play(sport: String){}
}

//Internal
internal class InternalClass {
    internal var age: Int = 23
    internal func play(sport: String){}
}

//File-private

fileprivate class FileprivateClass{
    fileprivate  var age: Int = 23
    fileprivate func play(sport: String){}
}

// Private

private class PrivateClass{
    private var age: Int = 23
    private  func play(sport: String){}
}
