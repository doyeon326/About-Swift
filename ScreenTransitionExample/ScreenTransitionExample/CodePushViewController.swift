//
//  CodePushViewController.swift
//  ScreenTransitionExample
//
//  Created by doyeona on 2021/11/13.
//

import UIKit

class CodePushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func tabBackbutton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
