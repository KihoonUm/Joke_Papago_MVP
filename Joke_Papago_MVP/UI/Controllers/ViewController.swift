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
    var presenter = JokePresenter(enJoke: JokeService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        englishTV.titleLB.text = "English"
        koreanTV.titleLB.text = "한국어"
       
        presenter.setView(jokeProviderView: self)
    }
    
    func setJokeView(enJoke: String) {
        self.englishTV.textView.text = enJoke
    }
    
    
    @IBAction func retryButton(_ sender: UIButton) {
        presenter.enJokeUpdate()
    }
}

