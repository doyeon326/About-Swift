//
//  SeguePushViewController.swift
//  ScreenTransitionExample
//
//  Created by doyeona on 2021/11/12.
//

import UIKit

class SeguePushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    
    }

    @IBAction func tapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
