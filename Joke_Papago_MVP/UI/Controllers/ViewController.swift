//
//  ViewController.swift
//  Joke_Papago_MVP
//
//  Created by Bard on 2022/02/03.
//

import UIKit
import Moya

class ViewController: UIViewController {

    @IBOutlet weak var englishTV: JokeView!
    @IBOutlet weak var koreanTV: JokeView!
    
//    var presenter : MainPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        englishTV.titleLB.text = "English"
        koreanTV.titleLB.text = "한국어"
        
        jokeSet()
        
        
    }
    func setJokeView(krJoke : String, enJoke : String){
        self.koreanTV.textView.text = krJoke
        self.englishTV.textView.text = enJoke
    }
    
    func jokeSet() {
        let provider = MoyaProvider<JokeAPI>()
        provider.request(.randomJokes("Um", "Bard")) {(result) in
            switch result {
            case let .success(response):
                let result = try? response.map(Joke.self)
                guard let str = result?.value?.joke else {
                    return
                }
                self.englishTV.textView.text = str
            case .failure(_):
                print(Error.self)
            }
        }
    }
    
    @IBAction func retryButton(_ sender: UIButton) {
//        presenter.showView()
    }
}

