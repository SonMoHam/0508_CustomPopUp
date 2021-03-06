//
//  ViewController.swift
//  0508_CustomPopUp
//
//  Created by 손대홍 on 2021/05/08.
//

import UIKit
import WebKit

let notificationName = "btnClickNotification"

class ViewController: UIViewController, PopUpDelegate {
    
    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var createPopUpBtn: UIButton!
    
    // 노티피케이션 해제
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 노티피케이션 등록
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(loadWebView),
                                               name: NSNotification.Name(rawValue: notificationName),
                                               object: nil)
    }
    
    @objc fileprivate func loadWebView() {
        print("viewController - loadWebView() called")
        let myNBlogUrl = URL(string: "https://blog.naver.com/stay_dcer")
        self.myWebView.load(URLRequest(url: myNBlogUrl!))
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
            let myBlogUrl = URL(string: "https://sonmo.tistory.com/?page=1")
            self.myWebView.load(URLRequest(url: myBlogUrl!))
        }
        
        
        customPopUpVC.myPopUpDelegate = self
        
        self.present(customPopUpVC, animated: true, completion: nil)
    }
    
    //MARK: - PopUpDelegate methods
    func onMoveGitHubBtnClicked() {
        print("viewController - onMoveGitHubBtnClicked() called")
        let myGitHubUrl = URL(string: "https://github.com/SonMoHam")
        self.myWebView.load(URLRequest(url: myGitHubUrl!))
    }
    
}

