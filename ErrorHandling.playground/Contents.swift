import UIKit

//Error Handling

//Adotando o protocolo Error

enum PrinterError: Error {
    
    case outPaper
    case noToner
    case onFire
    
}

func send (job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Não possui toner" {
        throw PrinterError.noToner
    }
    return "Trabalho enviado"
}

/// Usando um do catch

do {
    let printerResponse = try send(job: 1040, toPrinter: "Follha de Pagamento")
    print(printerResponse)
} catch {
    print(error)
}


do {
    let printerResponse = try send(job: 1040, toPrinter: "Fotos")
    print(printerResponse)
} catch PrinterError.onFire{
    print("Fotos queimadas...")
} catch let printerError as PrinterError {
    print("Erro na impressora.\(printerError)")
}catch {
    print(error)
}


print("--------------------------------------------------------------------------------------------")
// Exemplo 2 - Estoque, lançando excessoes

enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 3),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]

    var coinsDeposited = 0

    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }

        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }

        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }

        coinsDeposited -= item.price

        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem

        print("Distribuição: \(name).")
    }
}

let vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 20
try vendingMachine.vend(itemNamed: "Candy Bar")
 

var vendingMachine1 = VendingMachine()
vendingMachine1.coinsDeposited = 8
@MainActor func nourish(with item: String) throws {
    do {
        try vendingMachine.vend(itemNamed: item)
    }catch is VendingMachineError {
        print("Não foi possivel comprar isso da máquina de vendas automáticas")
    }
}
 
do {
    try nourish(with: "Chips novo Sabor")
}catch {
    print("Error inesperado. \(error)")
}


///Try optionals

let printerSucess = try? send(job: 1884, toPrinter: "Memmorando")
let printFailure = try? send(job: 1885, toPrinter: "Não possui toner")


///Defer

 
var fridgeIsOpen = false
let fridgeContent = ["leite", "ovo", "sobras"]

@MainActor
func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    let result = fridgeContent.contains(food)
    return result
}


fridgeContains("banana")

