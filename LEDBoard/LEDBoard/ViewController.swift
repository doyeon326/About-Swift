//
//  ViewController.swift
//  LEDBoard
//
//  Created by doyeona on 2021/11/16.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var contentLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let settingViewController = segue.destination as? SettingViewController {
            settingViewController.delegate = self
            settingViewController.ledText = self.contentLabel.text
            settingViewController.textColor = self.contentLabel.textColor
            settingViewController.backgroundColor = self.view.backgroundColor ?? .black
        }
    }
}

extension ViewController: LEDBoardSettingDelegate {
    func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor) {
        if let text = text {
            self.contentLabel.text = text
        }
        self.contentLabel.textColor = textColor
        self.view.backgroundColor = backgroundColor
    }
}


/*
 배운내용 정리
 
 UINavigationViewController - 객층 구조로 구성된 컨텐츠를 순차적으로 보여주는 컨테이너. navigation stack 이라고 불리는걸 사용해서 자식 뷰들을 관리한다.
 기본적으로 first in last out 으로 이용된다.
 
 화면전환 방법
 - View Controller의. View위에 다른 View를 가져와 바꿔치기 (메모리 누수의 위험이 있어서 X)
 - View Controller에서 다른 View Controller 를 호풀하여 전환하기
 - Navigation Controller 를 사용하여 화면 전환하기
 - 화면 전환용 객체 세그웨이(segueway)를 사용하여 화면 전환하기
 
 (인스턴스를 넘겨줘서.. )
 
 라이브사이클
 UIViewController에 객에체는 뷰객층을 정리하는 메서들이 정리되어있고 시스템에 의해 맞는 타이밍때 호풀이 된다.
 ViewDidLoad 는 메모리에 올라갔을때 딱 한번 호출
 viewDidAppear 는 화면이 보일때마다 호출된다.
 viewwilldissapear 뷰계층이 사라기전에 호출된다.
 viewdiddisappear 뷰가 완전히 사라진 후에 호출
 
 맞게 호출되면 적절한 처리를 해줄수있다.
 
 
 화면간 데이터 전달
 -코드로 구현된 화면 전환 방법에서 데이터를 전달하는방법
 스토리보드에 있는 뷰컨트롤러를 인스턴스화하면 프로퍼티에 접근해서 전달
 - 세그웨이로 구현된 하면 전환 방법에서 데이터 전달하기
 - Delegate 패턴을 이요하여 이전화면으로 데이텉 전달하기
 
 Asset에서 다양한 이미지를 추가하는 이유는 다양한 화면에서 해상도가 깨지지 않게 하기 위해서다. 
 */
