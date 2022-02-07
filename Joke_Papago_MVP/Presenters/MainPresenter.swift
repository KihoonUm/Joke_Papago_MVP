//
//  MainPresenter.swift
//  Joke_Papago_MVP
//
//  Created by Bard on 2022/02/03.
//

import Foundation
import Moya

protocol JokeProviderView : class {
    func setJokeView(enJoke : String)
    func setPaPaGoView( krJOke : String )
}

class JokePresenter  {
    let jokeGetService : JokeService
    let papagoService : PaPagoService
    weak var view : JokeProviderView?

    init(enJoke : JokeService, koJoke : PaPagoService) {
        self.jokeGetService = enJoke
        self.papagoService = koJoke
    }

    func setView(jokeProviderView : JokeProviderView?){
        self.view = jokeProviderView
    }
    
    // 농담을 View에 전달
    func enJokeUpdate() {
        jokeGetService.getJoke { [weak self] result in
            if let result = result {
                if let joke = result.value{
                    // 성공적으로 농담을 가져왔으면 PaPago 번역
                    self?.papagoService.transJoke(enJoke: joke.joke ?? "nil", callback: {[weak self] trans in
                        self?.view?.setPaPaGoView(krJOke: trans ?? "nil")
                    })
                    self?.view?.setJokeView(enJoke: joke.joke ?? "nil")
                    
                }
            }
        }
    }
    
}
