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
    
    var moveSiteBtnCompletionClosure: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("CustomPopUpViewController - viewDidLoad() called")
        
        contentView.layer.cornerRadius = 30
        moveSiteBtn.layer.cornerRadius = 10
    }
    
    @IBAction func onBgBtnClicked(_ sender: UIButton) {
        print("CustomPopUpViewController - onBgBtnClicked() called")
        
        //
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onMoveSiteBtnClicked(_ sender: UIButton) {
        print("CustomPopUpViewController - onMoveSiteBtnClicked() called")
    }
    
}
