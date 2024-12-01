import UIKit

 ///Concorrência

/* Execução de varias tarefas ao mesmo tempo. Mais de uma thread em execução*/

//Formas de tratar Concorrência GCD (antiga) e Async Await (nova)


//MARK: GCD

    /*
     * Uso
     * Sintaxe
     * Comportamento
     */


//let startTime = CFAbsoluteTimeGetCurrent()
//DispatchQueue.global().sync {
//    for i in 0...10{
//        print("Fui...\(i)")
//    }
//}
//
//DispatchQueue.global().sync {
//    for i in 0...10{
//        print("Voltei...\(i)")
//    }
//}

//DispatchQueue.main.sync {
//    //Executando na main thread
//}


//MARK: Async await

func fetchUserId(from server: String) async -> Int {
    if server == "primary" {
        return 97
    }
    return 501
}

func fetchUsername(from server: String) async -> String {
    let userId = await fetchUserId(from: server)
    if userId == 501 {
        return "João Souza"
    }
    
    return "Convidado"
}


func connectUser(to server: String) async {
    async let userId = fetchUserId(from: server)
    async let username = fetchUsername(from: server)
    let greeting = await "Olá \(username), user ID \(userId)"
    print(greeting)
}

Task {
    await connectUser(to: "primary")
}


//Ex2: Buscar nomes de fotos em uma galeria.

let gallery = ["Summer Vacation" : ["praia.png", "campo.png", "zoo.png", "shopping.png"],
               "Road Trip" : ["paris.png", "roma.png", "bahia.png", "madrid.png"]
]

func listPhotos(inGallery name : String) async -> [String] {
    //Simulação de rede async
    do {
        try await Task.sleep(until: .now + .seconds(2), clock: .continuous)
    } catch {
        
    }
    return gallery[name] ?? []
}

//Busca o nome das iamgens na galeria e mostra a primeira imagem

Task{
    let photoNames = await listPhotos(inGallery: "Summer Vacation")
    let sortedNames = photoNames.sorted()
    let name = sortedNames[0]
}
