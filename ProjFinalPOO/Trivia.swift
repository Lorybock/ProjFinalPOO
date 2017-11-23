//
//  Trivia.swift
//  ProjFinalPOO
//
//  Created by Lorena Paiva de Figueiredo on 18/11/17.
//  Copyright © 2017 Lorena Paiva de Figueiredo. All rights reserved.
//

import Foundation

class Trivia {

    private var dicas = Array<String>()
    private var resposta:String

    
    init(dica1: String, dica2: String, dica3:String, resposta:String) {
        self.dicas.append(dica1)
        self.dicas.append(dica2)
        self.dicas.append(dica3)
        self.resposta = resposta
    }
    
    func getResposta() -> String {
        return self.resposta
    }

    
    func testResp(resp: String) -> Bool {
        print(resp)
        if(getResposta().lowercased() == resp.lowercased()){
            return true
        }else{
            return false
        }
    }
    
    func getDicas(numDica:Int) -> String {
        print(self.dicas)
        return self.dicas[numDica]
    }
    
    
    
}
