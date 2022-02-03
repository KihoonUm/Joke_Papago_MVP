//
//  PaPagoAPI.swift
//  Joke_Papago_MVP
//
//  Created by Bard on 2022/02/03.
//

import Foundation
import Moya


enum PaPagoAPI {
    case transText(_ text : String?)
}

extension PaPagoAPI : TargetType{
    var baseURL: URL{
        return URL(string: "https://openapi.naver.com")!
    }
    var path: String {
        return "/v1/papago/n2mt"
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var task: Task {
        switch self {
        case .transText(let text):
            let params : [String : Any] = [
                "source" : "en",
                "target" : "ko",
                "text" : text ?? ""
            ]
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        let header = ["Content-Type:" : "application/x-www-form-urlencoded; charset=UTF-8" ,
                      "X-Naver-Client-Id" : "PYZj3_hxJXUpvIi9GgVZ",
                      "X-Naver-Client-Secret" : "gXuhE5I70X"]
        return header
    }
    
    
    
    
    
    
}
