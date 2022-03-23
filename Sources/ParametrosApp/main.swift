import Foundation

//Quais serao os meus paramentros ->
//CLIMA - ESTRANGEIRO OU NACIONAL - REGIAO - TIPO DE AMBIENTE
//Tipos de clima: Equatorial, Tropical, Temperado, Subtropical, Mediterrâneo, Frio, Frio de Montanha, Polar, Desértico e Semiárido. QUENTE E FRIO FDS
//Tipos de viagem Nacional e Internacional
//Regiao: (nacional -> norte, nordeste, sul, sudeste, centro-oeste)(internacional -> europa, asia, america, oceania, africa, antartida.
//Tipo de Ambiente: Serra, montanha, praia, deserto, florestas, cidade grande.
//Tipo de Comida: Japonesa, italiana, brasileira, sanduiches/pizza, mexicana, sorvete

struct Local: Decodable {
    let clima: String
    let regiao: String
    let tipoAmbiente: String
    var comida: String
    let urlLocal: String
    let urlHotel: String
    let urlFood: String
    
    public func printParametros() -> String {
        return """
        Clima: \(clima)
        Regiao: \(regiao)
        Tipo de Ambiente: \(tipoAmbiente)
        Comida: \(comida)
        
    """
    }
    public func printURls() -> String {
        return """
        URLLocal: \(urlLocal)
        URLHotel: \(urlHotel)
        URLFood: \(urlFood)
        
    """
    }
}


func verificarResp(){
    while true{
        if  yonFood != "n"  && yonFood != "s"  && yonFood != "nao"  && yonFood != "sim"{
            print("escreve direito ai mash")
            yonFood = readLine()!.lowercased()
        }else{
            break
        }
    }
}

func verificarRegion() {
    var locaisPorRegiao = filterRegiao(region, locais: locaisPorClima)
    
    if locaisPorRegiao.isEmpty {
        while locaisPorRegiao.isEmpty == true  {
            print("nao existe. Digite outra opcao:")
            region = readLine()!.lowercased()
            if (region == "a") {
                region = "norte"
            } else if (region == "b") {
                region = "nordeste"
            }else if (region == "c") {
                region = "sul"
            }else if (region == "d") {
                region = "sudeste"
            }else if (region == "e") {
                region = "centro oeste"
            }
            locaisPorRegiao = filterRegiao(region, locais: locaisPorClima)
        }
    }
    for local in locaisPorRegiao{
        print(local.printParametros())
    }
    
}

func verificarAmbiente() {
    var locaisPorAmbiente = filterAmb(typeAmb, locais: locaisPorRegiao)
    
    if locaisPorAmbiente.isEmpty {
        while locaisPorAmbiente.isEmpty == true  {
            print("nao existe. Digite outra opcao:")
            typeAmb = readLine()!.lowercased()
            if (typeAmb == "a") {
                typeAmb = "praia"
            } else if (typeAmb == "b") {
                typeAmb = "serra"
            }else if (typeAmb == "c") {
                typeAmb = "interior"
            }else if (typeAmb == "d") {
                typeAmb = "floresta"
            }else if (typeAmb == "e") {
                typeAmb = "cidade grande"
            }
            locaisPorAmbiente = filterAmb(typeAmb, locais: locaisPorRegiao)
        }
    }
    for local in locaisPorAmbiente{
        print(local.printParametros())
    }
    
}

func verificarComida() {
    var locaisPorComida = filterComida(food, locais: locaisPorAmbiente)
    if locaisPorComida.isEmpty {
        while locaisPorComida.isEmpty == true {
            print("nao existe. Digite outra opcao:")
            
            
        }
    }
    for local in locaisPorComida{
        print(local.printParametros())
    }
}
// Parametros que estou usando para utilizar no meus switch/case

let arquivoURL = Bundle.module.url(forResource: "locais", withExtension: "json")!
var listaDeLocais: [Local] = []

do {
    let locaisData = try Data(contentsOf: arquivoURL)
    listaDeLocais = try JSONDecoder().decode([Local].self, from: locaisData)
} catch {
    print(error)
}


// perguntas que serão realizadas ao meu usuário

// ------------------ CLIMA -------------------------

print("""
    Qual o clima que você quer? Quente(A) ou Frio(B)?
    Por favor, digite o nome ou a letra referente:
    """)
var climate = readLine()!.lowercased()
let validOptions1 = ["a","b","quente","frio"]
if !validOptions1.contains(climate) {
    while !validOptions1.contains(climate) {
        print("Insira novamente: Quente(A) ou Frio(B)")
        climate = readLine()!.lowercased()
    }
    print("clima escolhido: \(climate)")
    
    
}

if (climate == "a") {
    climate = "quente"
} else if (climate == "b") {
    climate = "frio"
}

var locaisPorClima = filterClima(climate, locais: listaDeLocais)
for local in locaisPorClima{
    print(local.printParametros())
}
//------------------ REGIAO -------------------------

print("""
    Qual a região do Brasil que você quer conhecer?
    Por favor, digite o nome ou a letra referente:
    Norte(a), Nordeste(b), Sul(c), Sudeste(d), Centro oeste(e)
    """)
var region = readLine()!.lowercased()
let validOptions2 = ["a","b","c","d","e","norte","nordeste","sul","sudeste","centro oeste"]
if (region == "a") {
    region = "norte"
} else if (region == "b") {
    region = "nordeste"
}else if (region == "c") {
    region = "sul"
}else if (region == "d") {
    region = "sudeste"
}else if (region == "e") {
    region = "centro oeste"
}
if !validOptions2.contains(region){
    while !validOptions2.contains(region) {
        print("Insira novamente: Norte(a), Nordeste(b), Sul(c), Sudeste(d), Centro oeste(e)")
        region = readLine()!.lowercased()
    }
    print("A regiao foi: \(region)")
}

verificarRegion()

var locaisPorRegiao = filterRegiao(region, locais: locaisPorClima)


//------------------ TIPO DE AMBIENTE ----------------------

print("""
    Qual o tipo de ambiente que voce deseja?
    Por favor, digite o nome ou a letra referente:
    Praia(a), Serra(b), Interior(c), Floresta(d), Cidade Grande(e)
    """)
var typeAmb = readLine()!.lowercased()
let validOptions3 = ["a","b","c","d","e","praia","serra","interior","floresta","cidade grande"]
if (typeAmb == "a") {
    typeAmb = "praia"
} else if (typeAmb == "b") {
    typeAmb = "serra"
}else if (typeAmb == "c") {
    typeAmb = "interior"
}else if (typeAmb == "d") {
    typeAmb = "floresta"
}else if (typeAmb == "e") {
    typeAmb = "cidade grande"
}
if !validOptions3.contains(typeAmb) {
    while !validOptions3.contains(typeAmb)  {
        print("Insira novamente: Praia(a), Serra(b), Interior(c), Floresta(d), Cidade Grande(e)")
        typeAmb = readLine()!.lowercased()
    }
    print("O tipo de ambiente escolhido foi: \(typeAmb)")
}

var locaisPorAmbiente = filterAmb(typeAmb, locais: locaisPorRegiao)

//--------------------- TIPO DE COMIDA -----------------------
var food: [String] = []
print("""
    Você tem alguma vontade de comer algo específico? SIM(S) ou NAO(N)?
    OBS.: Se você escolher, consideraremos todos os tipos de comida.
    """)
var yonFood = readLine()!.lowercased()
let validOptions4 = ["a", "b", "c", "d", "e", "f", "g", "japonesa", "italiana", "brasileira", "pizza", "mexicana", "sorvete", "sanduiche"]

verificarResp()
if yonFood == "s" || yonFood == "sim" {
    while yonFood == "s" || yonFood == "sim" {
        print("""
                Por favor, digite o nome ou a letra referente:
                Japonesa(A), Italiana(B), Brasileira(C), Pizza(D), Mexicana(E), Sorvete(F), Sanduiche(G)
            """)
        var typeFood = readLine()!.lowercased()
        
        if !validOptions4.contains(typeFood) {
            while !validOptions4.contains(typeFood)  {
                print("Insira novamente: Japonesa(A), Italiana(B), Brasileira(C), Pizza(D), Mexicana(E), Sorvete(F), Sanduiche(G)")
                typeFood = readLine()!.lowercased()
            }
            print("A comida escolhida foi: \(typeFood)")
            
        }
        if (typeFood == "a") {
            typeFood = "japonesa"
        } else if (typeFood == "b") {
            typeFood = "italiana"
        }else if (typeFood == "c") {
            typeFood = "brasileira"
        }else if (typeFood == "d") {
            typeFood = "pizza"
        }else if (typeFood == "e") {
            typeFood = "mexicana"
        }else if (typeFood == "f") {
            typeFood = "sorvete"
        }else if (typeFood == "g") {
            typeFood = "sanduiche"
        }
        food.append(typeFood)
        
        print("O(s) tipo(s) de comida(s) escolhido(s) foi(foram): \([food])")
        
        print("""
              Voce deseja acrescentar outra comida? Sim(s) ou Nao(n)
              Por favor, digite o nome ou a letra referente:
              """)
        yonFood = readLine()!.lowercased()
    }
    
} else if yonFood == "n" || yonFood == "nao"{
    print("Consideraremos todos os tipos de comida")
    food += ["japonesa","mexicana","brasileira","italiana","pizza","sanduiche","sorvete"]
}

print("A(s) comida(s) digitada(s) foi(ram): \([food])")

let locaisPorComida = filterComida(food, locais: locaisPorAmbiente)
for local in locaisPorComida{
    print(local.printParametros())
}

//-----------------------------------------
// Faremos os filtros por partes:
// filtra pelo tipo de clima
// filtra pelo regiao escolhida
// filtra pelo tipo de ambiente
// filtra pelo tipo de comida



func filterClima(_ string: String, locais: [Local]) -> [Local] {
    let climaList = locais.filter{$0.clima == string}
    return climaList
}


func filterRegiao(_ string: String, locais: [Local]) -> [Local] {
    let regiaoList = locais.filter{$0.regiao == string}
    return regiaoList
}


func filterAmb(_ string: String, locais: [Local]) -> [Local] {
    let ambList = locais.filter{$0.tipoAmbiente == string}
    return ambList
}


func filterComida(_ comidas: [String], locais: [Local]) -> [Local] {
    let comidaList = locais.filter{ comidas.contains($0.comida) }
    return comidaList
}



