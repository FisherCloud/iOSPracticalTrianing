//
//  RegisterViewController.swift
//  VPlayGameCommunity
//
//  Created by student on 2018/12/28.
//  Copyright © 2018年 余鑫 陈加兰 董雅蓓 陈鸿琦. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var idTextFeild: UITextField!
    @IBOutlet weak var nameTextFeild: UITextField!
    @IBOutlet weak var ageTextFeild: UITextField!
    @IBOutlet weak var sexTextFeild: UITextField!
    @IBOutlet weak var passwdOneTextFeild: UITextField!
    @IBOutlet weak var passwdTwoTextFeild: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    var sqlitedb: SQLiteDB!
    
    public var delegate: flushDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationItem.title = "注册"
        self.navigationController?.isToolbarHidden = false
        
        sqlitedb = SQLiteDB.shared
        _ = sqlitedb.openDB()
        
        submitButton.layer.cornerRadius = 10
        submitButton.layer.masksToBounds = true
        submitButton.titleLabel?.textColor = UIColor.white
        submitButton.titleLabel?.backgroundColor = #colorLiteral(red: 0.3333333333, green: 0.5254901961, blue: 0.8078431373, alpha: 1)
        submitButton.addTarget(self, action: #selector(submitBtnAction(_:)), for: .touchDown)
        
        passwdOneTextFeild.isSecureTextEntry = true
        passwdTwoTextFeild.isSecureTextEntry = true
    }
    
    @objc func submitBtnAction(_ sender: UIButton) {
        let id = idTextFeild.text
        let name = nameTextFeild.text
        let age = ageTextFeild.text
        let sex = sexTextFeild.text
        let passwdOne = passwdOneTextFeild.text
        let passwdTwo = passwdTwoTextFeild.text
        
        if passwdOne == passwdTwo {
            let sql = "insert into User(id,name,age,sex,password) values('\(id!)', '\(name!)', '\(age!)', '\(sex!)', '\(passwdOne!)');"
            
            let res = sqlitedb.execute(sql: sql)
            print("\(res)")
            if res >= 0 {
                user.flag = true
                let alertCtrl = UIAlertController(title: "提醒", message: "注册成功！跳转至登录界面...", preferredStyle: .alert)
                present(alertCtrl,animated: true)
                
                user.id = id!
                user.name = name!
                user.sex = sex == "男" ? Sex.female : Sex.male
                user.grade = 1
                user.age = Int(age!)!
                
                self.presentingViewController?.dismiss(animated: true, completion: nil)
            } else {
                let alertCtrl = UIAlertController(title: "提醒", message: "账号已存在！请重新输入！", preferredStyle: .alert)
                present(alertCtrl,animated: true)
                sleep(1)
                dismiss(animated: true, completion: nil)
            }
        }
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
