//
//  ViewController.swift
//  TodoList
//
//  Created by doyeona on 2021/11/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var task = [Task]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func tapAddButton(_ sender: Any) {
        let alert = UIAlertController(title: "할 일 등록", message: nil, preferredStyle: .alert)
        let registerButton = UIAlertAction(title: "등록", style: .default) { _ in
           
            debugPrint("\( alert.textFields?[0].text)")
        }
        let cancleButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(cancleButton)
        alert.addAction(registerButton)
        alert.addTextField { textField in
            textField.placeholder = "할 말을 입력해주세요"
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func tapEditButton(_ sender: UIBarButtonItem) {
     
    }
}

