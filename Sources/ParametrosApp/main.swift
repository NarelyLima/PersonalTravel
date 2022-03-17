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
}

// Parametros que estou usando para utilizar no meus switch/case

let arquivoURL = Bundle.module.url(forResource: "locais", withExtension: "json")!

do {
    let locaisData = try Data(contentsOf: arquivoURL)
    let listaDeLocais: [Local] = try JSONDecoder().decode([Local].self, from: locaisData)
    print(listaDeLocais[0])
} catch {
    print(error)
}

// perguntas que serão realizadas ao meu usuário

print("""
Qual o clima que você quer? Quente(A) ou Frio(B)?
Por favor, digite o nome ou a letra referente:
""")
var climate = readLine()!.lowercased()
if climate != "a" || climate != "b" {
while climate != "a" || climate != "b"{
        print("Insira novamente: Quente(A) ou Frio(B)")
        climate = readLine()!.lowercased()
}
    
}
print("O clima escolhido foi: \(climate)" )

print("""
Qual a região do Brasil que você quer conhecer?
Por favor, digite o nome ou a letra referente:
Norte(a), Nordeste(b), Sul(c), Sudeste(d), Centro-oeste(e)
""")
var region = readLine()!.lowercased()
print("O numero digitado foi: \(region)")

print("""
Qual o tipo de ambiente que voce deseja?
Por favor, digite o nome ou a letra referente:
Praia(a), Serra(b), Interior(c), Floresta(d)
""")
var typeAmb = readLine()!.lowercased()
print("O numero digitado foi: \(typeAmb)")

var food: [String] = []
print("""
    Você tem alguma vontade de comer algo específico? Se nao(n), se sim, qual/quais(s)?
    Por favor, digite o nome ou a letra referente:
    """)
var yonFood = readLine()!.lowercased()
if yonFood == "s" || yonFood == "sim" {
    while yonFood == "s" || yonFood == "sim" {
        print("""
                Por favor, digite o nome ou a letra referente:
                Japonesa(a), Italiana(b), Brasileira(c), Sanduiches/Pizza(d), Mexicana(e), Sorvete(f)
            """)
        var tFood = readLine()!.lowercased()
        food.append(tFood)
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
