import Foundation

// FUNCTIONS

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

func filterComida(_ string: [String], locais: [Local]) -> [Local] {
    let comidaList = locais.filter{ string.contains($0.comida) }
    return comidaList
}


//Quais serao os meus paramentros ->
//CLIMA - ESTRANGEIRO OU NACIONAL - REGIAO - TIPO DE AMBIENTE
//Tipos de clima: Equatorial, Tropical, Temperado, Subtropical, Mediterrâneo, Frio, Frio de Montanha, Polar, Desértico e Semiárido. QUENTE E FRIO FDS
//Tipos de viagem Nacional e Internacional
//Regiao: (nacional -> norte, nordeste, sul, sudeste, centro-oeste)(internacional -> europa, asia, america, oceania, africa, antartida.
//Tipo de Ambiente: Serra, montanha, praia, deserto, florestas, cidade grande.
//Tipo de Comida: Japonesa, italiana, brasileira, sanduiches/pizza, mexicana, sorvete
// STRUCT
struct Local: Decodable {
    let clima: String
    let regiao: String
    let tipoAmbiente: String
    var comida: String
    let urlLocal: String
    let urlHotel: String
    let urlFood: String
    
    public func printURls() -> String {
        return """
        As opções foram selecionadas com muito carinho. Clique nas URL's abaixo: 
        URLLocal: \(urlLocal)
        URLHotel: \(urlHotel)
        URLFood: \(urlFood)
        
    """
    }
}

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
print("\u{001B}[0;36mQual o clima que você quer? Quente(A) ou Frio(B)?\nPor favor, digite o nome ou a letra referente:")
var climate = readLine()!.lowercased()
let validOptions1 = ["a","b","quente","frio"] // listinha
if !validOptions1.contains(climate) {
    while !validOptions1.contains(climate) {
        print("Insira novamente: Quente(A) ou Frio(B)")
        climate = readLine()!.lowercased()
    }
    print("\u{001B}[0;35mO clima escolhido foi: \(climate)")
}

if (climate == "a") {
    climate = "quente"
} else if (climate == "b") {
    climate = "frio"
}

var locaisPorClima = filterClima(climate, locais: listaDeLocais) // primeiro passo da humanidade.

//------------------ REGIAO -------------------------

func verificarRegiao(locais: [Local]) -> [Local] {
    var region = readLine()!.lowercased() //climate
    let validOptions2 = ["a","b","c","d","e","norte","nordeste","sul","sudeste","centro oeste"]
    if !validOptions2.contains(region){
        while !validOptions2.contains(region) {
            print("Insira novamente: Norte(a), Nordeste(b), Sul(c), Sudeste(d), Centro oeste(e)")
            region = readLine()!.lowercased()
        }
        print("\u{001B}[0;35mA regiao escolhida foi: \(region)")
    }
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
    
    return filterRegiao(region, locais: locais)
    
}

print("\u{001B}[0;32mQual a região do Brasil que você quer conhecer?\nPor favor, digite o nome ou a letra referente:\nNorte(a), Nordeste(b), Sul(c), Sudeste(d), Centro oeste(e)")

var locaisPorRegiao = verificarRegiao(locais: locaisPorClima)

while locaisPorRegiao.isEmpty {
    print("Entre novamente")
    locaisPorRegiao = verificarRegiao(locais: locaisPorClima)
}

//------------------ TIPO DE AMBIENTE ----------------------

func verificarAmbiente(locais: [Local]) -> [Local]{
    
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
            print("\u{001B}[0;33mInsira novamente: Praia(a), Serra(b), Interior(c), Floresta(d), Cidade Grande(e)")
            typeAmb = readLine()!.lowercased()
        }
        print("\u{001B}[0;35mO ambiente escolhido foi: \(typeAmb)")
    }
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
    return filterAmb(typeAmb, locais: locais)
    
}

print("\u{001B}[0;33mQual o tipo de ambiente que voce deseja?\nPor favor, digite o nome ou a letra referente:\nPraia(a), Serra(b), Interior(c), Floresta(d), Cidade Grande(e)nao")

var locaisPorAmbiente = verificarAmbiente(locais: locaisPorRegiao)

while locaisPorAmbiente.isEmpty {
    print("Entre novamente")
    locaisPorAmbiente = verificarAmbiente(locais: locaisPorRegiao)
}

//--------------------- TIPO DE COMIDA -----------------------
func verificarComida(locais: [Local]) -> [Local]{
    var food: [String] = []
    
    var yonFood = readLine()!.lowercased()
    let validOptions4 = ["a", "b", "c", "d", "e", "f", "g", "japonesa", "italiana", "brasileira", "pizza", "mexicana", "sorvete", "sanduiche"]
    
    while true{
        if  yonFood != "n"  && yonFood != "s"  && yonFood != "nao"  && yonFood != "sim"{
            print("Digite novamente: SIM(S) ou NAO(N)")
            yonFood = readLine()!.lowercased()
        }else{
            break
        }
    }
    if yonFood == "s" || yonFood == "sim" {
        while yonFood == "s" || yonFood == "sim" {
            print("\u{001B}[0;32mPor favor, digite o nome ou a letra referente:\nJaponesa(A), Italiana(B), Brasileira(C), Pizza(D), Mexicana(E), Sorvete(F), Sanduiche(G)")
            var typeFood = readLine()!.lowercased()
            
            if !validOptions4.contains(typeFood) {
                while !validOptions4.contains(typeFood)  {
                    print("Insira novamente: Japonesa(A), Italiana(B), Brasileira(C), Pizza(D), Mexicana(E), Sorvete(F), Sanduiche(G)")
                    typeFood = readLine()!.lowercased()
                }
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
            
            print("""
              Voce deseja acrescentar outra comida? Sim(s) ou Nao(n)
              Por favor, digite o nome ou a letra referente:
              """)
            yonFood = readLine()!.lowercased()
        }
        
    } else if yonFood == "n" || yonFood == "nao"{
        print("\u{001B}[0;32mConsideraremos todos os tipos de comida")
        food += ["japonesa","mexicana","brasileira","italiana","pizza","sanduiche","sorvete"]
    }
    print("\u{001B}[0;35mA(s) comida(s) digitada(s) foi(ram): \([food])")
    return filterComida(food, locais: locais)
}
print("\u{001B}[0;31mVocê tem alguma vontade de comer algo específico? SIM(S) ou NAO(N)?\nOBS.: Se você escolher, consideraremos todos os tipos de comida.")

var locaisPorComida = verificarComida(locais: locaisPorAmbiente)

while locaisPorComida.isEmpty {
    print("Infelizmente ainda não temos essa opcao no nosso banco de dados, digite outra alternativa: ")
    locaisPorComida = verificarComida(locais: locaisPorAmbiente)
}


for local in locaisPorComida {
    print(local.printURls())
}
//-----------------------------------------
// Faremos os filtros por partes:
// filtra pelo tipo de clima
// filtra pelo regiao escolhida
// filtra pelo tipo de ambiente
// filtra pelo tipo de comida



//case reset = "\u{001B}[0;0m"
//   case black = "\u{001B}[0;30m"
//   case red = "\u{001B}[0;31m"
//   case green = "\u{001B}[0;32m"
//   case yellow = "\u{001B}[0;33m"
//   case blue = "\u{001B}[0;34m"
//   case magenta = "\u{001B}[0;35m"
//   case cyan = "\u{001B}[0;36m"
//   case white = "\u{001B}[0;37m"



