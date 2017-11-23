//
//  CreateTrivias.swift
//  ProjFinalPOO
//
//  Created by Lorena Paiva de Figueiredo on 20/11/17.
//  Copyright © 2017 Lorena Paiva de Figueiredo. All rights reserved.
//

import Foundation

class CreateTrivia {
    
    private var trivias = [Trivia]()
    
    private func create() {
        var d = ["Pneu", "Lápis", "Começa com a letra B"];
        d = mixDicas(dicas: d)
        trivias.append(Trivia(dica1:d[0], dica2:d[1], dica3:d[2], resposta:"Borracha"))
        d = ["XX", "Macho", "Começa com a letra F"]
        d = mixDicas(dicas: d)
        trivias.append(Trivia(dica1:d[0], dica2:d[1], dica3:d[2], resposta:"Fêmea"))
        d = ["O Cavaleiro das Trevas", "Morcego", "Começa com a letra B"]
        d = mixDicas(dicas: d)
        trivias.append(Trivia(dica1:d[0], dica2:d[1], dica3:d[2], resposta:"Batman"))
        d = ["Nintendo", "It's a me,...", "Mascote"]
        d = mixDicas(dicas: d)
        trivias.append(Trivia(dica1:d[0], dica2:d[1], dica3:d[2], resposta:"Mario"))
        d = ["Buarque", "Anysio", "Bento"]
        d = mixDicas(dicas: d)
        trivias.append(Trivia(dica1:d[0], dica2:d[1], dica3:d[2], resposta:"Chico"))
        d = ["Sherlock Holmes", "Harry Potter", "Capital"]
        d = mixDicas(dicas: d)
        trivias.append(Trivia(dica1:d[0], dica2:d[1], dica3:d[2], resposta:"Londres"))
        d = ["Super-heroína", "Diana", "Themyscira"]
        d = mixDicas(dicas: d)
        trivias.append(Trivia(dica1:d[0], dica2:d[1], dica3:d[2], resposta:"Mulher-Maravilha"))
        d = ["Nós temos o Hulk", "Gênio, bilionário, playboy, filantropo", "Tony Stark"]
        d = mixDicas(dicas: d)
        trivias.append(Trivia(dica1:d[0], dica2:d[1], dica3:d[2], resposta:"Homem de Ferro"))
        d = ["Garfo", "Colher", "Faca"]
        d = mixDicas(dicas: d)
        trivias.append(Trivia(dica1:d[0], dica2:d[1], dica3:d[2], resposta:"Talheres"))
        d = ["Peixe assado", "Batata Frita", "Macarronada"]
        d = mixDicas(dicas: d)
        trivias.append(Trivia(dica1:d[0], dica2:d[1], dica3:d[2], resposta:"Comida"))
    }
    
    func getTrivias() -> Array<Trivia> {
        create()
        var last = self.trivias.count - 1
        while(last > 0){
            let rand = Int(arc4random_uniform(UInt32(last)))
            self.trivias.swapAt(last, rand)
            last -= 1
        }
        return self.trivias
    }
    
    private func mixDicas(dicas: Array<String>) -> Array<String> {
        var dicas = dicas
        var last = dicas.count - 1
        while(last > 0){
            let rand = Int(arc4random_uniform(UInt32(last)))
            dicas.swapAt(last, rand)
            last -= 1
        }
        return dicas
    }
    
    
}
