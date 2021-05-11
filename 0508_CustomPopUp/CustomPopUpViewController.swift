//
//  CustomPopUpViewController.swift
//  0508_CustomPopUp
//
//  Created by 손대홍 on 2021/05/08.
//

import Foundation
import UIKit

class CustomPopUpViewController : UIViewController {
 
    
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var moveSiteBtn: UIButton!
    @IBOutlet weak var bgBtn: UIButton!
    @IBOutlet weak var moveGitHubBtn: UIButton!
    
    var moveSiteBtnCompletionClosure: (() -> Void)?
    
    var myPopUpDelegate: PopUpDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("CustomPopUpViewController - viewDidLoad() called")
        
        contentView.layer.cornerRadius = 30
        moveSiteBtn.layer.cornerRadius = 10
        moveGitHubBtn.layer.cornerRadius = 10
    }
    
    //MARK: - IBActions
    @IBAction func onBgBtnClicked(_ sender: UIButton) {
        print("CustomPopUpViewController - onBgBtnClicked() called")
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onMoveSiteBtnClicked(_ sender: UIButton) {
        print("CustomPopUpViewController - onMoveSiteBtnClicked() called")
        
        self.dismiss(animated: true, completion: nil)
        // 컴플레션 블럭 호출
        if let moveSiteBtnCompletionClosure = moveSiteBtnCompletionClosure {
            // 메인에 알림
            moveSiteBtnCompletionClosure()
        }
    }
    
    @IBAction func onMoveGitHubBtnClicked(_ sender: UIButton) {
        print("CustomPopUpViewController - onMoveGitHubBtnClicked() called")
        
        myPopUpDelegate?.onMoveGitHubBtnClicked()
        self.dismiss(animated: true, completion: nil)
    }
    
    

    
}
