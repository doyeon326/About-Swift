//
//  SettingViewController.swift
//  LEDBoard
//
//  Created by doyeona on 2021/11/16.
//

import UIKit

protocol LEDBoardSettingDelegate: AnyObject {
    func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor)
}
class SettingViewController: UIViewController {
//MARk: - Properties
    @IBOutlet weak var purpleBtn: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var yellowBtn: UIButton!
    @IBOutlet weak var orangeBtn: UIButton!
    @IBOutlet weak var blueBtn: UIButton!
    @IBOutlet weak var blackBtn: UIButton!
    @IBOutlet weak var greenBtn: UIButton!
    
    weak var delegate: LEDBoardSettingDelegate?
    var textColor: UIColor = .yellow
    var backgroundColor: UIColor = .black
    var ledText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    private func configureView() {
        if let ledText = ledText {
            self.textField.text = ledText
        }
        self.changeTextColor(color: self.textColor)
        self.changeBackgroundColor(color: self.backgroundColor)
    }
    @IBAction func tabTextColorBtn(_ sender: UIButton) {
        if sender == self.yellowBtn {
            changeTextColor(color: .yellow)
            self.textColor = .yellow
        } else if sender == self.purpleBtn {
            changeTextColor(color: .purple)
            self.textColor = .purple
        } else if sender == self.greenBtn {
            changeTextColor(color: .green)
            self.textColor = .green
        }
    }
    
    @IBAction func tabBackgroundColorBtn(_ sender: UIButton) {
        if sender == self.blackBtn {
            changeBackgroundColor(color: .black)
            self.backgroundColor = .black
        } else if sender == self.blueBtn {
            changeBackgroundColor(color: .blue)
            self.backgroundColor = .blue
        } else if sender == self.orangeBtn {
            changeBackgroundColor(color: .orange)
            self.backgroundColor = .orange
        }
    }
    
    @IBAction func tabSaveBtn(_ sender: Any) {
        self.delegate?.changedSetting(text: self.textField.text, textColor: self.textColor, backgroundColor: self.backgroundColor)
        self.navigationController?.popViewController(animated: true)
        
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
