//
//  ViewController.swift
//  Joke_Papago_MVP
//
//  Created by Bard on 2022/02/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var englishTV: JokeView!
    @IBOutlet weak var koreanTV: JokeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        englishTV.titleLB.text = "English"
        koreanTV.titleLB.text = "한국어"
        
    }

}

