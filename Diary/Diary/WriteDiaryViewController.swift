//
//  WriteDiaryViewController.swift
//  Diary
//
//  Created by doyeona on 2021/11/24.
//

import UIKit

enum DiaryEditorMode {
    case new
    case edit(IndexPath, Diary)
}

protocol WriteDiaryViewDelegate: AnyObject {
    func didSelectRegister(diary: Diary)
}

class WriteDiaryViewController: UIViewController {
    @IBOutlet var contenTextView: UITextView!
    
    @IBOutlet var confirmButton: UIBarButtonItem!
    @IBOutlet var dateTextField: UITextField!
    @IBOutlet var titleTextField: UITextField!
    

    private let datePicker = UIDatePicker()
    private var diaryDate: Date?
    weak var delegate: WriteDiaryViewDelegate?
    var diaryEditorMode: DiaryEditorMode = .new
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContentsTextView()
        configureDatePicker()
        self.confirmButton.isEnabled = false
        configureInputField()
        configureEditMode()

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
    private func configureInputField() {
        self.contenTextView.delegate = self
        self.titleTextField.addTarget(self, action: #selector(titleTextFieldDidChange(_:)), for: .editingChanged)
        self.dateTextField.addTarget(self, action: #selector(titleTextFieldDidChange(_:)), for: .editingChanged)
    }
    
    @IBAction func tapConfirmButton(_ sender: Any) {
        guard let title = self.titleTextField.text else { return }
        guard let contents = self.contenTextView.text else { return }
        guard let date = self.diaryDate else { return }
       
        switch self.diaryEditorMode {
        case .new:
            let diary = Diary(title: title, contents: contents, date: date, isStar: false)
            
            self.delegate?.didSelectRegister(diary: diary)
            
        case let .edit(indexPath, diary):
            let diary = Diary(title: title, contents: contents, date: date, isStar: diary.isStar)
            NotificationCenter.default.post(name: NSNotification.Name("editDiary"), object: diary, userInfo: [
            "indexPath.row" : indexPath.row
        ])
            
        }
        
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func datePickerValueDidChange(_ datePicker: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일(EEEEE)"
        formatter.locale = Locale(identifier: "ko_KR")
        self.diaryDate = datePicker.date
        self.dateTextField.text = formatter.string(from: datePicker.date)
        self.dateTextField.sendActions(for: .editingChanged )
        
    }
    
    @objc private func titleTextFieldDidChange(_ textField: UITextField) {
        self.validateInputField()
    }
    
    @objc private func dateTextFieldDidChangne(_ textField: UITextField) {
        self.validateInputField()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func validateInputField() {
        self.confirmButton.isEnabled = !(self.titleTextField.text?.isEmpty ?? true) && !(self.dateTextField.text?.isEmpty ?? true) && !self.contenTextView.text.isEmpty
    }
    private func configureEditMode() {
        switch self.diaryEditorMode {
        case let .edit(_, diary): self.titleTextField.text = diary.title
            self.contenTextView.text = diary.contents
            self.dateTextField.text = self.dateToString(date: diary.date)
            self.diaryDate = diary.date
            self.confirmButton.title = "수정"
        default: break
        }
    }
    
    private func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "YY년 MM월 dd일(EEEEE)"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: date)
    }
}

extension WriteDiaryViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        self.validateInputField()
    }
}
