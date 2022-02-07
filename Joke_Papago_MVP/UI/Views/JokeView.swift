//
//  JokeView.swift
//  Joke_Papago_MVP
//
//  Created by Bard on 2022/02/03.
//

import UIKit

protocol JokeViewDelegate{
    func JokeViewRetry()
}

class JokeView: UIView {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var titleLB: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadXib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.loadXib()
    }
    
    
    private func loadXib(){
        let identifier = String(describing: type(of: self))
        let nibs = Bundle.main.loadNibNamed(identifier, owner: self, options: nil)
        
        guard let jokeView = nibs?.first as? UIView else { return }
        
        jokeView.frame = self.bounds
        self.addSubview(jokeView)
    }
}
