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
    @IBOutlet weak var idTextFeild: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    public var delegate: flushDelegate?
    
    var sqlitedb: SQLiteDB!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        sqlitedb = SQLiteDB.shared
        _ = sqlitedb.openDB()
        
        self.navigationItem.title = "添加好友"
        self.navigationController?.isToolbarHidden = false
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", style: .done, target: self, action: #selector(returnBarButtonItemAction(_:)))
        
        submitButton.addTarget(self, action: #selector(submitBtnAction), for: .touchDown)
    }
    
    @objc func submitBtnAction() {
        _ = nameTextFeild.text
        let id = idTextFeild.text
        
        var sql = "select * from User where id = '\(id!)'"
        let res = sqlitedb.query(sql: sql)
        
        if res.count > 0 {
            sql = "insert into Relationsgip values('\(user.id)','\(id!)');"
            let re = sqlitedb.execute(sql: sql)
            if re >= 0 {
                
                if delegate != nil {
                    delegate?.flushUserInfo()
                }
                
                let alertCtrl = UIAlertController(title: "提醒", message: "添加成功！", preferredStyle: .alert)
                present(alertCtrl,animated: true)
            } else {
                let alertCtrl = UIAlertController(title: "提醒", message: "添加失败！", preferredStyle: .alert)
                present(alertCtrl,animated: true)
            }
        } else {
            let alertCtrl = UIAlertController(title: "提醒", message: "不存在此用户！", preferredStyle: .alert)
            present(alertCtrl,animated: true)
        }
        sleep(1)
        dismiss(animated: true, completion: nil)
    }
    
    @objc func returnBarButtonItemAction(_ sender: UIBarButtonItem) {
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
