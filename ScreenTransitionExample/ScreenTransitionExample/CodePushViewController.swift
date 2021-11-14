//
//  CodePushViewController.swift
//  ScreenTransitionExample
//
//  Created by doyeona on 2021/11/13.
//

import UIKit

class CodePushViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name {
            self.nameLabel.text = name
        }
    }
    
    @IBAction func tabBackbutton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
