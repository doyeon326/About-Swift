//
//  RoundButton.swift
//  Calculator
//
//  Created by doyeona on 2021/11/19.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {

    @IBInspectable var isRound: Bool = false {
        didSet {
            if isRound {
                print("size: \(self.frame.height)")
                self.layer.cornerRadius =  self.frame.height / 2.0
            }
        }
    }
}
