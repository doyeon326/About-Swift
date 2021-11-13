//
//  CodePresentViewController.swift
//  ScreenTransitionExample
//
//  Created by doyeona on 2021/11/13.
//

import UIKit

class CodePresentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tabBackBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
