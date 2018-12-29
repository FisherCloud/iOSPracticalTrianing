//
//  SetViewController.swift
//  VPlayGameCommunity
//
//  Created by student on 2018/12/28.
//  Copyright © 2018年 余鑫 陈加兰 董雅蓓 陈鸿琦. All rights reserved.
//

import UIKit

class SetViewController: UIViewController {

    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    public var delegate: flushDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        loginButton.layer.cornerRadius = 10
        loginButton.layer.masksToBounds = true
        registerButton.layer.cornerRadius = 10
        loginButton.layer.masksToBounds = true
        
        loginButton.setTitle("登录", for: .normal)
        registerButton.setTitle("注册", for: .normal)
        
        loginButton.addTarget(self, action: #selector(loginBtnAction(_:)), for: .touchDown)
        registerButton.addTarget(self, action: #selector(registerBtnAction(_:)), for: .touchDown)
        
        self.navigationItem.title = "设置"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", style: .done, target: self, action: #selector(returnAction(_:)))
        self.navigationController?.isNavigationBarHidden = false
        
    }
    
    @objc func returnAction(_ sender: UIBarButtonItem) {
        if delegate != nil {
            delegate?.flushUserInfo()
        }
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @objc func loginBtnAction(_ sender: UIButton) {
        let loginView = storyboard?.instantiateViewController(withIdentifier: "LoginView") as! LoginViewController
        //loginView.delegate = self
        let nav = UINavigationController(rootViewController: loginView)
        nav.isToolbarHidden = false
        
        present(nav, animated: true)
    }
    
    @objc func registerBtnAction(_ sender: UIButton) {
        let registerView = storyboard?.instantiateViewController(withIdentifier: "RegisterView") as! RegisterViewController
        let nav = UINavigationController(rootViewController: registerView)
        
        present(nav, animated: true)
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
