//
//  DiaryDetailViewController.swift
//  Diary
//
//  Created by doyeona on 2021/11/25.
//

import UIKit

//protocol DiaryDetailViewDelegate: AnyObject {
//    func didSelectDelete(indexPath: IndexPath)
//}

class DiaryDetailViewController: UIViewController {

    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var contentsTextView: UITextView!
    @IBOutlet var titleLabel: UILabel!
  //  weak var delegate: DiaryDetailViewDelegate?
    
    var diary: Diary?
    var indexPath: IndexPath?
    
    var starButton: UIBarButtonItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        NotificationCenter.default.addObserver(self, selector: #selector(starDiaryNotification(_:)), name: NSNotification.Name("starDiary"), object: nil)
    }
    
    private func configureView() {
        guard let diary = self.diary else { return }
        self.titleLabel.text = diary.title
        self.contentsTextView.text = diary.contents
        self.dateLabel.text = dateToString(date: diary.date)
        self.starButton = UIBarButtonItem(image: nil, style: .plain, target: self, action: #selector(tapStarButton))
        self.starButton?.image = diary.isStar ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        self.starButton?.tintColor = .orange
        self.navigationItem.rightBarButtonItem = self.starButton
    }

    @objc func starDiaryNotification(_ notification: Notification) {
        guard let starDiary = notification.object as? [String : Any] else { return }
        guard let isStar = starDiary["isStar"] as? Bool else { return }
        guard let uuidString = starDiary["uuidString"] as? String else { return }
        guard let diary = diary else { return }
        if diary.uuidString == uuidString {
            self.diary?.isStar = isStar
            self.configureView()
        }
        
  
    }
    @objc func tapStarButton() {
        guard let isStar = self.diary?.isStar else { return }
      //  guard let indexPath = indexPath else { return }

        if isStar {
            self.starButton?.image = UIImage(systemName: "star")
        } else {
            self.starButton?.image = UIImage(systemName: "star.fill")
        }
        self.diary?.isStar = !isStar
        
        NotificationCenter.default.post(name: NSNotification.Name("starDiary"), object: [
            "diary" : self.diary,
            "isStar": self.diary?.isStar ?? false,
            "uuidString" : self.diary?.uuidString
        ],
        userInfo: nil
        )
        //self.delegate?.didSelectStar(indexPath: indexPath, isStar: self.diary?.isStar ?? false)
    }
    private func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "YY??? MM??? dd???(EEEEE)"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: date)
    }

    @IBAction func tappEditButton(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "WriteDiaryViewController") as? WriteDiaryViewController else { return }
        guard let indexPath = indexPath else {
            return
        }
        guard let diary = diary else {
            return
        }
        
        viewController.diaryEditorMode = .edit(indexPath, diary)
        NotificationCenter.default.addObserver(self, selector: #selector(editDiaryNotification(_:)), name: NSNotification.Name("editDiary"), object: nil)

        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func tapDeleteButton(_ sender: UIButton) {
        guard let uuidString = self.diary?.uuidString else { return }
     //   self.delegate?.didSelectDelete(indexPath: indexPath)
        NotificationCenter.default.post(name: NSNotification.Name("deleteDiary"), object: uuidString, userInfo: nil)
        self.navigationController?.popViewController(animated: true)

    }
    
    @objc func editDiaryNotification(_ notification: Notification) {
        guard let diary = notification.object as? Diary else { return }
        //guard let row = notification.userInfo?["indexPath.row"] as? Int else { return }
        self.diary = diary
        self.configureView()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
