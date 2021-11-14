//
//  CodePresentViewController.swift
//  ScreenTransitionExample
//
//  Created by doyeona on 2021/11/13.
//

import UIKit

protocol SendDataDelegate: AnyObject {
    func sendData(name: String)
}

class CodePresentViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    var name: String?ㄴ
    weak var delegate: SendDataDelegate?
    // delegate 변수 앞에는 weak 를 붙여줘야하고 아닐시에는 메모리 누수가 발생할수있다.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name {
            self.nameLabel.text = name
        }
    }

    @IBAction func tabBackBtn(_ sender: Any) {
        self.delegate?.sendData(name: "Doyeon")
        self.dismiss(animated: true, completion: nil)
    }
}
