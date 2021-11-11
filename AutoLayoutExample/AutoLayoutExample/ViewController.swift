//
//  ViewController.swift
//  AutoLayoutExample
//
//  Created by doyeona on 2021/11/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func changeColorBtnTapped(_ sender: Any) {
        print("btn tapped!")
        self.colorView.backgroundColor = .blue
    }
}

