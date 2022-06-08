# PersonalTravel

Essa aplicação de terminal busca encontrar uma viagem/destino a partir de seus gostos pessoais.
Serão disponibilizados, também, nomes de pontos turísticos, hotéis e restaurantes(A ideia para trabalhos posteriores é colocar os links dos respectivos pontos turísticos, hotéis e restaurantes).
Eu considerei que essa aplicação iria me ajudar muito nas minhas próximas viagens, visto que sou muito indecisa e ter um aplicativo que já me mostra os destinos de acordo com o meu mood seria perfeito.

## Explicando a lógica

O projeto é dividivo em locais.json e main.swift

 - locais.json:
   - Estará inserida a lista de dados que serão utilizados em toda a minha implementação
   - Serão apresentadas algumas das mais variadas combinações possíveis das respostas dos usuários.
   - Contém os parâmetros que serão filtrados
 - main.swift:
   - A parte inicial apresentará todas as funcões que serão utilizadas
   - As 4(quatro) primeirar referem-se aos filtros. Eles mantêm um padrão, recebem uma string(resposta do usuário) e filtra na lista referente a pergunta anterior.
   -- Como assim a lista anterior?
   - A pergunta referente ao clima filtra todas as combinações inseridas na pasta locais.json que possuem a característica do usuário, por exemplo, quente
   - O filtro que agirá após a resposta do usuário não filtrará todas as combinações em cima da minha lista geral localizada na pasta locais.json, mas sim na lista criada pelo filtro do clima(climaList), caso contrário, não iria ser personalizado.
   - E assim por diante com os filtros voltados ao tipo de ambiente e tipo de comida.

   - Após os filtros temos as funções de verificação sobre a existência de uma combinação em cima da resposta do usuário.
   -- Como assim a existência de uma combinação?
   - O número total de combinações que o programa permite são 350, no entanto não existe API pública com tanto dados, e como é uma atividade voltada ao aprendizado, escolhi percorrer o caminho mais longo.
   - Visto isso, temos como exemplos lúdico a combinação (quente, sul, praia, japonesa), esta combinação não existe no banco de dados, logo será solicitada ao usuário para escolher uma alternativa diferente.

   - Temos também uma struct, visto que não era necessário no meu códigoc fazer herança ou coisas semelhantes, a forma de escrita era mais simples e abraçava com o projeto.
   - Dentro dela objetificamos cada linha do locais.json, podendo trabalha com elas chamando pela sua chave.
   - Além disso, temos a funcão printParamentros que foi auxiliou na debugação e ver se o código estava me entregando o que eu estava pedindo; e a função printURL's que é função que de fato será imprimida ao usuário.

   - Posteriormente temos a apresentação do Decoder, nos possibilitando mexer na pasta locais.json.
    
   - E o restante do código é sobre o manueseio das diferentes respostas e como ele deve lidar para não crashar.
    
## Deploy

O usuário será exposto a 4 perguntas:
 - Qual o clima que ele deseja
   -- Quente/Frio
 - Qual a região brasileira que tem interesse de conhecer
   -- Norte/Sul/Sudeste/Centro Oeste/Nordeste
 - Qual o tipo de ambiente que deseja 
   --  Praia/Serra/Interior/Floresta/Cidade Grande
 - Qual o tipo de comida que prefere(podendo escolher mais de uma opção)
   -- Japonesa/Italiana/Brasileira/Pizza/Mexicana/Sorvete/Sanduiche

A partir das suas respostas os filtros e funções agirão para fornecer uma ou mais combinações ao usuário.

## Referência

 - [Curso de Swift do Zero](https://www.youtube.com/watch?v=MnL3-a3eKNQ&list=PLJ0AcghBBWShgIH122uw7H9T9-NIaFpP-)
 - [Para que serve um API](https://www.swift.org/documentation/api-design-guidelines/)
 - [O que é API de fato](https://vertigo.com.br/o-que-e-api-entenda-de-uma-maneira-simples/)
 - [O que é Web Scraping](https://canaltech.com.br/seguranca/o-que-e-web-scraping/)
 - [Como utilizar o JSON](https://code.tutsplus.com/pt/tutorials/working-with-json-in-swift--cms-25335)
 - [Como decodificar o JSON](https://www.avanderlee.com/swift/json-parsing-decoding/)
 - [Qual a diferença de Class e Struct](https://www.alura.com.br/artigos/ios-swift-classes-struct-diferencas-usar)
 - [Como utilizar o while e for](https://code.tutsplus.com/pt/tutorials/swift-from-scratch-optionals-and-control-flow--cms-22874)
 - [Opcionais](https://code.tutsplus.com/pt/tutorials/swift-from-scratch-optionals-and-control-flow--cms-22874)
 - [Como fazer um filtro](https://abhimuralidharan.medium.com/higher-order-functions-in-swift-filter-map-reduce-flatmap-1837646a63e8)
 - [Como fazer uma função](https://code.tutsplus.com/pt/tutorials/swift-from-scratch-an-introduction-to-functions--cms-22879)
 - [Como colocar cor no terminal](https://openssl.medium.com/while-developing-ios-applications-we-often-find-ourselves-using-command-line-tools-in-ruby-6ef53046925c)


## Autores

- [Narely Lima de Oliveira](https://github.com/NarelyLima)
