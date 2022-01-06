//
//  ViewController.swift
//  Pomodoro
//
//  Created by doyeon kim on 2022/01/04.
//

import UIKit
import AudioToolbox

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
    var timer: DispatchSourceTimer?
    var currentSeconds = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureToggleBtn()
    }
    
    func startTimer() {
        if self.timer == nil {
            self.timer = DispatchSource.makeTimerSource(flags: [], queue: .main)
            self.timer?.schedule(deadline: .now(), repeating: 1)
            self.timer?.setEventHandler(handler: { [weak self] in
                guard let self = self else { return }
                self.currentSeconds -= 1
              
                let hour = self.currentSeconds / 3600
                let minutes = (self.currentSeconds % 3600) / 60
                let seconds = (self.currentSeconds % 3600) % 60
                self.timerLabel.text = String(format: "%02d:%02d:%02d", hour, minutes, seconds)
                self.progressView.progress = Float(self.currentSeconds) / Float(self.duration)
                debugPrint(self.progressView.progress)
                
                print("progress: \(self.progressView.progress), duration: \(self.duration)")
                if self.currentSeconds <= 0 {
                    //타이머가 종료
                    self.stopTimer()
                    
                    AudioServicesPlaySystemSound(1005)
                }
            })
            self.timer?.resume()
        }
    }
    
    func stopTimer() {
        if self.timerStatus == .pause {
            self.timer?.resume()
        }
        self.timerStatus = .end
        self.cancelBtn.isEnabled = false
        self.setTimerInfoViewVisible(isHidden: true)
        self.datePicker.isHidden = false
        self.toggleBtn.isSelected = false
        self.timer?.cancel()
        self.timer = nil
        //만약 일시정지가 상태에서 suspend 로 하면 수행해야할 작업이 있음으로 인지하기 때문에 nil을 대입하면 런타임 에러가 나기때문에 resume 으로 상태를 먼저 변경해줘야한다.
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
            self.stopTimer()
        default:
            break
        }
    }
    
    @IBAction func tapToggleBtn(_ sender: UIButton) {
        self.duration = Int(self.datePicker.countDownDuration)
        switch self.timerStatus {
        case .end:
            self.currentSeconds = self.duration
            self.timerStatus = .start
            self.setTimerInfoViewVisible(isHidden: false)
            self.datePicker.isHidden = true
            self.toggleBtn.isSelected = true
            self.cancelBtn.isEnabled = true
            self.startTimer()
        case .start:
            self.timerStatus = .pause
            self.toggleBtn.isSelected = false
            self.timer?.suspend()
        case .pause:
            self.timerStatus = .start
            self.toggleBtn.isSelected = true
            self.timer?.resume()
        }
    }
    
    
}

