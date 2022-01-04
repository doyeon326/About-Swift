//
//  ViewController.swift
//  Pomodoro
//
//  Created by doyeon kim on 2022/01/04.
//

import UIKit

enum TimerStatus {
    case start
    case pause
    case end
}

class ViewController: UIViewController {
    @IBOutlet weak var toggleBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var timerLabel: UILabel!
    
    var duration = 60
    var timerStatus: TimerStatus = .end
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureToggleBtn()
        // Do any additional setup after loading the view.
    }
    
    func setTimerInfoViewVisible(isHidden: Bool) {
        self.timerLabel.isHidden = isHidden
        self.progressView.isHidden = isHidden
    }
    
    func configureToggleBtn() {
        self.toggleBtn.setTitle("시작", for: .normal)
        self.toggleBtn.setTitle("일시정지", for: .selected)
    }
    
    @IBAction func tapCancelBtn(_ sender: UIButton) {
        switch self.timerStatus {
        case .start, .pause:
            self.timerStatus = .end
            self.cancelBtn.isEnabled = false
            self.setTimerInfoViewVisible(isHidden: true)
            self.datePicker.isHidden = false
            self.toggleBtn.isSelected = false
        default:
            break
        }
    }
    
    @IBAction func tapToggleBtn(_ sender: UIButton) {
        self.duration = Int(self.datePicker.countDownDuration)
        switch self.timerStatus {
        case .end:
            self.timerStatus = .start
            self.setTimerInfoViewVisible(isHidden: false)
            self.datePicker.isHidden = true
            self.toggleBtn.isSelected = true
            self.cancelBtn.isEnabled = true
        case .start:
            self.timerStatus = .pause
            self.toggleBtn.isSelected = false
        case .pause:
            self.timerStatus = .start
            self.toggleBtn.isSelected = true
        default: break
        }
    }
    
    
}

