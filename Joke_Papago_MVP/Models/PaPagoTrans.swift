//
//  PaPagoTrans.swift
//  Joke_Papago_MVP
//
//  Created by Bard on 2022/02/03.
//

import Foundation


struct PaPagoTrans : Codable {
    var message : Message?
    
    struct Message : Codable {
        var result : TrandInfo?
        
        struct TrandInfo : Codable{
            var translatedText : String?
        }
    }
}
