//
//  PaPagoService.swift
//  Joke_Papago_MVP
//
//  Created by Bard on 2022/02/07.
//

import Foundation
import Moya

// Data Provider 역할을 하게 되는 Service Class
class PaPagoService {
    
    // 번역된 농담을 가져오는 함수
    func transJoke(enJoke : String, callback : @escaping (String?) -> Void  ) {
        let provider = MoyaProvider<PaPagoAPI>()
        provider.request(.transText(enJoke)) {(result) in
            switch result{
            case let .success(response):
                let transData = try? response.map(PaPagoTrans.self)
                guard let trans = transData?.message?.result?.translatedText else {
                    return
                }
                callback(trans)
               
            case .failure(_):
                print(Error.self)
            }
        }
    }
}
