import UIKit


//Generics

func makeArray<Item>(reapeting item: Item, numberOfTimes: Int) -> [Item] {
    var result: [Item] = []
    
    for _ in 0..<numberOfTimes {
        result.append(item)
     
    }
    return result
}

makeArray(reapeting: "bater", numberOfTimes: 4)

///Implementando  tipo opcional da biblioteca padrão do Swift.

enum OptionalValue<Warapped>{
    case none
    case some(Warapped)
}

var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)


//Where - Especificar uma lista de requisitos

func anyCommonElments<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
where T.Element: Equatable, T.Element == U.Element {
    for lhsItem in lhs{
        for rhsItem in rhs{
            if lhsItem == rhsItem{
                return true
            }
        }
    }
    return false
}

anyCommonElments([1,2,3], [3])
