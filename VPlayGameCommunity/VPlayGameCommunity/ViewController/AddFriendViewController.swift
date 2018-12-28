//
//  AddFriendViewController.swift
//  VPlayGameCommunity
//
//  Created by 506 on 2018/12/29.
//  Copyright © 2018年 余鑫 陈加兰 董雅蓓 陈鸿琦. All rights reserved.
//

import UIKit

class AddFriendViewController: UIViewController {
    
    @IBOutlet weak var nameTextFeild: UITextField!
    @IBOutlet weak var gradeTextFeild: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var returnBarButtonItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @objc func submitBtnAction() {
        
    }
    
    @objc func returnBarButtonItemAction() {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
