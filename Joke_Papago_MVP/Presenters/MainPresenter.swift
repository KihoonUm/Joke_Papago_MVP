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
}

class JokePresenter  {
    let jokeGetService : JokeService
    weak var view : JokeProviderView?

    init(enJoke : JokeService) {
        self.jokeGetService = enJoke
    }

    func setView(jokeProviderView : JokeProviderView?){
        self.view = jokeProviderView
    }
    
    func enJokeUpdate() {
        jokeGetService.getJoke { [weak self] result in
            if let result = result {
                if let joke = result.value{
                    self?.view?.setJokeView(enJoke: joke.joke ?? "nil")
                    
                }
            }
        }
        print("showview")
    }

   


}
