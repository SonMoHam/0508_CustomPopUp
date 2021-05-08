//
//  ViewController.swift
//  0508_CustomPopUp
//
//  Created by 손대홍 on 2021/05/08.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var createPopUpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onCreatePopUpBtnClicked(_ sender: UIButton) {
        print("viewController - onCreatePopUpBtnClicked() called")
        
        // 스토리보드 가져옴
        let storyboard = UIStoryboard.init(name: "PopUp", bundle: nil)
        
        // 스토리보드 통해 뷰컨트롤러 가져옴
        let customPopUpVC = storyboard.instantiateViewController(withIdentifier: "AlertPopUpVC") as! CustomPopUpViewController
        
        // 뷰 컨트롤러 보여지는 스타일
        customPopUpVC.modalPresentationStyle = .overCurrentContext
        
        // 뷰 컨트롤러 사라지는 스타일
        customPopUpVC.modalTransitionStyle = .crossDissolve
        
        customPopUpVC.moveSiteBtnCompletionClosure = {
            print("moveSiteBtnCompletionClosure / 컴플레션 블럭 호출됨")
            let myBlogUrl = URL(string: "")
            self.myWebView.load(URLRequest(url: myBlogUrl!))
        }
        
        self.present(customPopUpVC, animated: true, completion: nil)
    }
    
}

