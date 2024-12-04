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


//Mover uma foto de uma galeria para outra

func add(_ photo: String, toGallery: String) {
    print("Adicionando a foto \(photo) na galeria \(toGallery)")
}

func remove(_ photo: String, fromGallery: String) {
    print("Remove a foto \(photo) na galeria \(fromGallery)")
}

Task {
    let firstPhoto = await listPhotos(inGallery: "Summer Vacation")[0]
    add(firstPhoto, toGallery: "Road Trip")
///Neste ponto, o firstPhoto está temporariamente em ambas as galerias
    remove(firstPhoto, fromGallery: "Summer Vacation")
}

///refatorando em uma func Sync, assim ela nao podera conter possiveis pontos de suspensao, nao vai ficar aramazenada em 2 lugares ao mesmo tempo, no futuro se tentar add codigo concorrente a essa func ela vai retornar um erro em tempo de compilacao ao inves de bug
func move(_ photoName: String, from source: String, to destination: String) {
    add(photoName, toGallery: destination)
    remove(photoName, fromGallery: source)
}

Task {
    let handle = FileHandle.standardInput
    for try await line in handle.bytes.lines {
        print(line)
    }
}


func downloadPhoto(named: String) async -> Data {
    ///Simular chamada ao backEnd
    do {
        try await Task.sleep(until: .now + .seconds(2), clock: .continuous)
    }catch{}
        return Data()
    }

Task{
    
    let photosNames = await listPhotos(inGallery: "Summer Vacation")

    async let firstPhoto = downloadPhoto(named: photosNames[0])
    async let secondPhoto =  downloadPhoto(named: photosNames[1])
    async let thirdPhoto =  downloadPhoto(named: photosNames[2])
    
    let photos = await [ firstPhoto, secondPhoto, thirdPhoto]
}


//Tarefas em grupo de tarefas - Simulteanidade Estruturada

Task{
    await withTaskGroup(of: Data.self) { taskGroup in
        let photoNames = await listPhotos(inGallery: "Summer Vacation")
        for name in photoNames {
            taskGroup.addTask{ await downloadPhoto(named: name)}
        }
        
    }
}


Task {
    let photo = await listPhotos(inGallery: "Summer Vacation")[0]
    let handle = Task {
        return await downloadPhoto(named: photo)
    }
    let result = await handle.value
}


//Actores

actor TemparatureLogger {
    let label: String
    var measurements: [Int]
    private(set) var max: Int
    
    init( label: String, measurements: Int) {
        self.label = label
        self.measurements = [measurements]
        self.max = measurements
    }
}

Task{
    let logger = TemparatureLogger(label: "Ao ar livre", measurements: 25)
    print(await logger.max)
}

extension TemparatureLogger {
    func update(with measurement: Int) {
        measurements.append(measurement)
        if measurement > max {
            max = measurement
        }
    }
}


struct TemperatureReading: Sendable {
    var measurement: Int
}

extension TemparatureLogger {
    func addReading(frm reading: TemperatureReading){
        measurements.append(reading.measurement)
    }
}


Task{
    let logger = TemparatureLogger(label: "Chaleira", measurements: 45)
    let reading = TemperatureReading(measurement: 45)
    await logger.addReading(frm: reading)
}
