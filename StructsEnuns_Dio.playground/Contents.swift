import UIKit

//Enum
enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eigth, nine, ten
    case jack, queen, king
    
    func simpleDescription() -> String {
        switch self {
            case .ace:
                return "Ace"
            case .jack:
                return "Jack"
            case .queen:
                return "Queen"
            case .king:
                return "King"
            default:
                return String(self.rawValue)
        }
    }
}


let ace = Rank.ace
let aceRawValue = ace.rawValue


if let convertedRank = Rank(rawValue: 3){
    let threeDescription = convertedRank.simpleDescription()
}

enum Suit {
    case spades, hearts, diamonds, clubs
    
    func simpleDescription() -> String {
        switch self{
                
            case .spades:
                return "spades"
            case .hearts:
                return "hearts"
            case .diamonds:
                return "diamonds"
            case .clubs:
                return "clubs"
        }
    }
}

let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()


//Valores Associados
enum ServerResponse {
    case result(String, String)
    case failure(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Fora do intervalo")

switch success {
    case let .result(sunrise, sunset):
        print("O nascer do sol é \(sunrise) e o por do sol é \(sunset).")
    case let .failure(message):
        print("Falha...\(message)")
}


//MARK: - Structs

struct Card{
    var rank: Rank
    var suit: Suit
    
    func  simpleDescription() -> String {
        return " O \(rank.simpleDescription()) do \(suit.simpleDescription())"
    }
}

let threeOfSpades  = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()


