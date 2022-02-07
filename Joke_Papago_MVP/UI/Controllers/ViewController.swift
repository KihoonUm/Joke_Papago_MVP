//
//  ViewController.swift
//  Joke_Papago_MVP
//
//  Created by Bard on 2022/02/03.
//

import UIKit

class ViewController: UIViewController, JokeProviderView {

    @IBOutlet weak var englishTV: JokeView!
    @IBOutlet weak var koreanTV: JokeView!

    //presenter
    var jokePresenter = JokePresenter(enJoke: JokeService(), koJoke: PaPagoService())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        englishTV.titleLB.text = "English"
        koreanTV.titleLB.text = "한국어"
       
        jokePresenter.setView(jokeProviderView: self)
    }
    
    func setJokeView(enJoke: String) {
        self.englishTV.textView.text = enJoke
    }
    
    func setPaPaGoView(krJOke: String) {
        self.koreanTV.textView.text = krJOke
    }
    
    @IBAction func retryButton(_ sender: UIButton) {
        jokePresenter.enJokeUpdate()

    }
}

