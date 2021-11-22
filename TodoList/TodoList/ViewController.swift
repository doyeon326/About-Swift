//
//  ViewController.swift
//  TodoList
//
//  Created by doyeona on 2021/11/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var task = [Task](){
        //할일이 추가 될때마다 불린다.
        didSet {
            self.saveTasks()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.loadTasks()
        // Do any additional setup after loading the view.
    }


    @IBAction func tapAddButton(_ sender: Any) {
        let alert = UIAlertController(title: "할 일 등록", message: nil, preferredStyle: .alert)
        let registerButton = UIAlertAction(title: "등록", style: .default) { [weak self] _ in
            
            guard let title = alert.textFields?[0].text else { return }
            let task = Task(title: title, done: false)
            
            self?.task.append(task)
            self?.tableView.reloadData()
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
    
    func saveTasks() {
        let data = self.task.map {
            [
                "title": $0.title,
                "done": $0.done
            ]
        }
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: "task")
    }
    
    func loadTasks() {
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.object(forKey: "task") as? [[String: Any]] else { return }
        self.task = data.compactMap{
            guard let title = $0["title"] as? String else { return nil }
            guard let done = $0["done"] as? Bool else { return nil}
            return Task(title: title, done: done)
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.task.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let task = self.task[indexPath.row]
        cell.textLabel!.text = task.title
        return cell
    }
}
