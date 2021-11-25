//
//  WriteDiaryViewController.swift
//  Diary
//
//  Created by doyeona on 2021/11/24.
//

import UIKit

class WriteDiaryViewController: UIViewController {
    @IBOutlet var contenTextView: UITextView!
    
    @IBOutlet var confirmButton: UIBarButtonItem!
    @IBOutlet var dateTextField: UITextField!
    @IBOutlet var titleTextField: UITextField!
    

    private let datePicker = UIDatePicker()
    private var diartDate: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContentsTextView()
        configureDatePicker()

    }
    private func configureContentsTextView() {
        let borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0)
        self.contenTextView.layer.borderColor = borderColor.cgColor
        //레이어 관련색상은 cg로 해줘아함.
        self.contenTextView.layer.borderWidth = 0.5
        self.contenTextView.layer.cornerRadius = 5.0
    }

    private func configureDatePicker() {
        self.datePicker.datePickerMode = .date
        self.datePicker.preferredDatePickerStyle = .wheels
        self.datePicker.addTarget(self, action: #selector(datePickerValueDidChange(_:)), for: .valueChanged)
        self.datePicker.locale = Locale(identifier: "ko_KR")
        self.dateTextField.inputView = self.datePicker
        
    }
    @IBAction func tapConfirmButton(_ sender: Any) {
    }
    
    @objc private func datePickerValueDidChange(_ datePicker: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일(EEEEE)"
        formatter.locale = Locale(identifier: "ko_KR")
        self.dateTextField.text = formatter.string(from: datePicker.date)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
