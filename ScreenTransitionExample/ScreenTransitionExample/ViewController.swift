//
//  ViewController.swift
//  ScreenTransitionExample
//
//  Created by doyeona on 2021/11/12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("뷰가 로드 되었다.")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("뷰가 나타날것이다.")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("뷰가 나타났다.")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("뷰가 사라질것이다.")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("뷰가 사라졌다.")
    }
    
    
    
    
    
    
    @IBAction func tabCodePushBtn(_ sender: Any) {
        //스토리보드에 있는 뷰컨트롤러를 인스턴스화해줘야한다.
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "CodePushViewController") as? CodePushViewController else { return }
        viewController.name = "Doyeon"
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func tabCdoePresentBtn(_ sender: Any) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "CodePresentViewController") as? CodePresentViewController else { return }
        viewController.name = "Doyeon"
        viewController.delegate = self
        self.present(viewController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? SeguePushViewController {
            viewController.name = "Doyeon"
        }
    }
}

extension ViewController: SendDataDelegate {
    func sendData(name: String) {
        self.nameLabel.text = name
        self.nameLabel.sizeToFit() // 텍스트에 맞게 label size 조절
    }
}
