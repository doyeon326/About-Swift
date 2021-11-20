//
//  ViewController.swift
//  Calculator
//
//  Created by doyeona on 2021/11/18.
//

import UIKit

enum Operation {
    case Add
    case Subtract
    case Divide
    case Multiply
    case unknown
}

class ViewController: UIViewController {

    @IBOutlet weak var numberOutputLabel: UILabel!
    
    var displayNumber = "" //아웃풋
    var firstOperant = "" //이전결과값
    var secondOperand = "" //새롭게 입력된값
    var result = ""
    var currentOperation: Operation = .unknown
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

//MARK: - Actions
    @IBAction func tapNumberButton(_ sender: UIButton) {
        guard let numberValue = sender.title(for: . normal) else { return }
        if self.displayNumber.count < 9 {
            self.displayNumber += numberValue
            self.numberOutputLabel.text = self.displayNumber
        }
    }
    
    @IBAction func tapClearButton(_ sender: Any) {
        self.displayNumber = "" //아웃풋
        self.firstOperant = "" //이전결과값
        self.secondOperand = "" //새롭게 입력된값
        self.result = ""
        self.currentOperation = .unknown
        self.numberOutputLabel.text = "0"
    }
    
    @IBAction func tabDotButton(_ sender: Any) {
        if self.displayNumber.count < 8, !self.displayNumber.contains(".") {
            self.displayNumber += self.displayNumber.isEmpty ? "0." : "."
            self.numberOutputLabel.text = self.displayNumber
        }
    }
    
    @IBAction func tabDivideButton(_ sender: Any) {
        self.operation(.Divide)
    }
    @IBAction func tabMultiplyButton(_ sender: Any) {
        self.operation(.Multiply)
    }
    @IBAction func tabSubtractButton(_ sender: Any) {
        self.operation(.Subtract)
    }
    @IBAction func tabAdditionButton(_ sender: Any) {
        self.operation(.Add)
    }
    @IBAction func tabEqualButton(_ sender: Any) {
        self.operation(self.currentOperation)
    }
    
    func operation(_ operation: Operation) {
        if self.currentOperation != .unknown {
            if !self.displayNumber.isEmpty {
                self.secondOperand = self.displayNumber
                self.displayNumber = ""
                
                guard let firstOperand = Double(firstOperant) else { return }
                guard let secondOperand = Double(secondOperand) else { return }
                
                switch self.currentOperation {
                case .Add : self.result = "\(firstOperand + secondOperand)"
                case .Subtract: self.result = "\(firstOperand - secondOperand)"
                case .Divide: self.result = "\(firstOperand / secondOperand)"
                case .Multiply: self.result = "\(firstOperand * secondOperand)"
                default: break
                }
                
                if let result = Double(self.result), result.truncatingRemainder(dividingBy: 1) == 0 {
                    self.result = "\(Int(result))"
                }
                self.firstOperant = self.result
                self.numberOutputLabel.text = self.result
            }
            self.currentOperation = operation
        } else {
            self.firstOperant = self.displayNumber
            self.currentOperation = operation
            self.displayNumber = ""
        }
    }
}

