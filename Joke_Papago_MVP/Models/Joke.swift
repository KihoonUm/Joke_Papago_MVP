//
//  Joke.swift
//  Joke_Papago_MVP
//
//  Created by Bard on 2022/02/03.
//

import Foundation
import UIKit

struct Joke : Codable{
    var tyoe : String?
    var value : Value?
    
    struct Value : Codable{
        var id : Int?
        var joke : String?
    }
}
