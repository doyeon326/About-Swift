//
//  SettingViewController.swift
//  LEDBoard
//
//  Created by doyeona on 2021/11/16.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var purpleBtn: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var yellowBtn: UIButton!
    @IBOutlet weak var orangeBtn: UIButton!
    @IBOutlet weak var blueBtn: UIButton!
    @IBOutlet weak var blackBtn: UIButton!
    @IBOutlet weak var greenBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tabTextColorBtn(_ sender: UIButton) {
        if sender == self.yellowBtn {
            changeTextColor(color: .yellow)
        } else if sender == self.purpleBtn {
            changeTextColor(color: .purple)
        } else if sender == self.greenBtn {
            changeTextColor(color: .green)
        }
    }
    
    @IBAction func tabBackgroundColorBtn(_ sender: UIButton) {
        if sender == self.blackBtn {
            changeBackgroundColor(color: .black)
        } else if sender == self.blueBtn {
            changeBackgroundColor(color: .blue)
        } else if sender == self.orangeBtn {
            changeBackgroundColor(color: .orange)
        }
    }
    
    @IBAction func tabSaveBtn(_ sender: Any) {
    }
    
    private func changeTextColor(color: UIColor) {
        self.yellowBtn.alpha = color == UIColor.yellow ? 1: 0.2
        self.purpleBtn.alpha = color == UIColor.purple  ? 1: 0.2
        self.greenBtn.alpha = color == UIColor.green ? 1: 0.2
    }
    
    private func changeBackgroundColor(color: UIColor) {
        self.blackBtn.alpha = color == UIColor.black ? 1: 0.2
        self.blueBtn.alpha = color == UIColor.blue  ? 1: 0.2
        self.orangeBtn.alpha = color == UIColor.orange ? 1: 0.2
    }
    
}
