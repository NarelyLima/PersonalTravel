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
    let comida: String
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


func verificar(){
    while true{
        if  yonFood != "n"  && yonFood != "s"  && yonFood != "nao"  && yonFood != "sim"{
            print("escreve direito ai mash")
            yonFood = readLine()!.lowercased()
        }else{
            break
        }
    }
}

// Parametros que estou usando para utilizar no meus switch/case

let arquivoURL = Bundle.module.url(forResource: "locais", withExtension: "json")!
var listaDeLocais: [Local] = []

do {
    let locaisData = try Data(contentsOf: arquivoURL)
    listaDeLocais = try JSONDecoder().decode([Local].self, from: locaisData)
    print(listaDeLocais[0])
} catch {
    print(error)
}

//print(listaDeLocais[0])

// perguntas que serão realizadas ao meu usuário

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
} else {
    print("clima escolhido: \(climate)")
}

print(filterClima(climate))
//-------------------------------------------

print("""
Qual a região do Brasil que você quer conhecer?
Por favor, digite o nome ou a letra referente:
Norte(a), Nordeste(b), Sul(c), Sudeste(d), Centro oeste(e)
""")
var region = readLine()!.lowercased()
let validOptions2 = ["a","b","c","d","e","norte","nordeste","sul","sudeste","centro oeste"]
if !validOptions2.contains(region){
    while !validOptions2.contains(region) {
        print("Insira novamente: Norte(a), Nordeste(b), Sul(c), Sudeste(d), Centro oeste(e)")
        region = readLine()!.lowercased()
    }
    print("A regiao foi: \(region)")
} else {
    print("A regiao foi: \(region)")
}

//----------------------------------------

print("""
Qual o tipo de ambiente que voce deseja?
Por favor, digite o nome ou a letra referente:
Praia(a), Serra(b), Interior(c), Floresta(d), Cidade Grande(e)
""")
var typeAmb = readLine()!.lowercased()
let validOptions3 = ["a","b","c","d","e","praia","serra","interior","floresta","Cidade Grande"]
if !validOptions3.contains(typeAmb) {
    while !validOptions3.contains(typeAmb)  {
        print("Insira novamente: Praia(a), Serra(b), Interior(c), Floresta(d), Cidade Grande(e)")
        typeAmb = readLine()!.lowercased()
    }
    print("O tipo de ambiente escolhido foi: \(typeAmb)")
} else{
    print("O tipo de ambiente escolhido foi: \(typeAmb)")
}

//--------------------------------------------
var food: [String] = []
print("""
    Você tem alguma vontade de comer algo específico? SIM(S) ou NAO(N)?
    """)
var yonFood = readLine()!.lowercased()
let validOptions4 = ["a", "b", "c", "d", "e", "f", "g", "japonesa", "italiana", "brasileira", "pizza", "mexicana", "sorvete", "sanduiche"]

verificar()
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
            food.append(typeFood)
            
        } else {
            food.append(typeFood)
        }
        print("O(s) tipo(s) de comida(s) escolhido(s) foi(foram): \([food])")
        
        print("""
              Voce deseja acrescentar outra comida? Sim(s) ou Nao(n)
              Por favor, digite o nome ou a letra referente:
              """)
        yonFood = readLine()!.lowercased()
    }
    
} else if yonFood == "n" || yonFood == "nao"{
    print("Consideraremos todos os tipos de comida")
}

print("O numero digitado foi: \([food])")





//-----------------------------------------
// Faremos os filtros por partes:
// filtra pelo tipo de clima
// filtra pelo regiao escolhida
// filtra pelo tipo de ambiente
// filtra pelo tipo de comida

var climaList: [String]
func filterClima(_ string: String) {
    let climaList = listaDeLocais.filter{$0.clima == string}
   climaList.forEach { travel in
       print(travel.printParametros())
   }
}

let regiaoList: [String]
func filterRegiao(_ string: String) {
    regiaoList = climaList.filter{$0.regiao == string}
   regiaoList.forEach { travel in
       print(travel.printParametros())
   }
}

var ambList: [String]
func filterAmb(_ string: String) {
    ambList = regiaoList.filter{$0.tipoAmbiente == string}
   ambList.forEach { travel in
       print(travel.printParametros())
   }
}

var comidaList: [String]
func filterComida(_ string: String) {
    comidaList = ambList.filter{$0.comida == string}
   comidaList.forEach { travel in
       print(travel.printParametros())
   }
}


//
