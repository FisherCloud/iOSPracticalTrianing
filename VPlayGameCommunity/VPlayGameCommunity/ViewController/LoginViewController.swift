//
//  LoginViewController.swift
//  VPlayGameCommunity
//
//  Created by student on 2018/12/28.
//  Copyright © 2018年 余鑫 陈加兰 董雅蓓 陈鸿琦. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var userNameTextFeild: UITextField!
    @IBOutlet weak var passwdTextFeild: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    var sqlitedb: SQLiteDB!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        initial()
    }
    
    func initial() {
        
        imageView.layer.cornerRadius = imageView.bounds.width / 2
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "8.png")
        
        loginButton.layer.cornerRadius = 10
        loginButton.layer.masksToBounds = true
        registerButton.layer.cornerRadius = 10
        loginButton.layer.masksToBounds = true
        
        loginButton.setTitle("登录", for: .normal)
        registerButton.setTitle("注册", for: .normal)
        
        loginButton.addTarget(self, action: #selector(loginBtnAction(_:)), for: .touchDown)
        registerButton.addTarget(self, action: #selector(registerBtnAction(_:)), for: .touchDown)
        
        userNameTextFeild.keyboardType = .namePhonePad
        passwdTextFeild.keyboardType = .numberPad
        passwdTextFeild.isSecureTextEntry = true
        
        sqlitedb = SQLiteDB.shared
        _ = sqlitedb.openDB()
    }
    
    @objc func loginBtnAction(_ sender: UIButton) {
        let username = userNameTextFeild.text
        let password = passwdTextFeild.text
        
        let sql = "select * from User where name = '\(username!)' and password = '\(password!)'"
        
        let res = sqlitedb.query(sql: sql)
        
        if res.count > 0 {
            user.flag = true
            let alertCtrl = UIAlertController(title: "提醒", message: "登录成功！欢迎来到VPlay游戏社区！", preferredStyle: .alert)
            present(alertCtrl,animated: true)
            self.presentingViewController?.dismiss(animated: true, completion: nil)
        } else {
            let alertCtrl = UIAlertController(title: "提醒", message: "登录登录！用户名或密码错误！", preferredStyle: .alert)
            present(alertCtrl,animated: true)
        }
        
    }
    
    @objc func registerBtnAction(_ sender: UIButton) {
        
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
