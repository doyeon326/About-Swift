//
//  ViewController.swift
//  QuoteGenerator
//
//  Created by doyeona on 2021/11/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var quoteLabel: UILabel!
    let quote = [
        Quote(content: "오늘은 정말 좋군", name: "김도연"),
        Quote(content: "오늘은 정말 좋군 키키", name: "김지니"),
        Quote(content: "오늘은 정말 좋군 코코", name: "호인영"),
        Quote(content: "오늘은 정말 좋군 큐큐", name: "김두연"),
        Quote(content: "오늘은 정말 좋군 헤헤", name: "이두현")
        
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func tapQuoteGeneratorButton(_ sender: Any) {
        let random = Int(arc4random_uniform(5)) //  0-4사이의 난수를 발생함
        let quote = quote[random]
        self.quoteLabel.text = quote.content
        self.nameLabel.text = quote.name
    }
}

