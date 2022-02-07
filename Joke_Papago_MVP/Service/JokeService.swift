//
//  JokeService.swift
//  Joke_Papago_MVP
//
//  Created by Bard on 2022/02/03.
//

import Foundation
import Moya

// Data Provider 역할을 하게 되는 Service Class
class JokeService {
    
    // 영문의 농담을 가져오는 함수
    func getJoke(callback : @escaping (Joke?) -> Void) {
        let provider = MoyaProvider<JokeAPI>()
        provider.request(.randomJokes("Um", "Bard")) {(result) in
            switch result {
            case let .success(response):
                if let result = try? response.map(Joke.self){
                    callback(result)
                  
                }else{
                    callback(nil)
                }
            case .failure(_):
                print(Error.self)
                callback(nil)
            }
        }
    }
}
