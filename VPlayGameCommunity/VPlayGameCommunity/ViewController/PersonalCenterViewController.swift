//
//  PersonalCenterViewController.swift
//  VPlayGameCommunity
//
//  Created by student on 2018/12/27.
//  Copyright © 2018年 余鑫 陈加兰 董雅蓓 陈鸿琦. All rights reserved.
//

import UIKit

class PersonalCenterViewController: UIViewController {

    var arrList = ["徽章", "我的讨论帖", "留言", "设置", "关于我们"]
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    
    override func viewDidLoad() {

        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setImage()
        
        imageView.layer.cornerRadius = imageView.bounds.size.width / 2.0
        imageView.layer.masksToBounds = true
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", style: .done, target: self, action: #selector(returnAction(_:)))
    }
    
    @objc func returnAction(_ sender: UIBarButtonItem) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnAction(_ sender: UIBarButtonItem) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func setImage() {
        //print("\(user.flag ? "true" : "false")")
        if user.flag {
            imageView.image = UIImage(named: "8.png")
            usernameLabel.text = "姓名：\(user.name)"
            ageLabel.text = "年龄：\(user.age)"
            gradeLabel.text = "等级：\(user.grade)"
        } else {
            alertUnLogin("当前账户未登录！有些功能将无法使用！")
            imageView.image = UIImage(named: "unLogin.png")
        }
    }
    
    func alertUnLogin(_ message: String) {
        let alertCtrl = UIAlertController(title: "提示", message: message, preferredStyle: .alert)
        let alertLogin = UIAlertAction(title: "是", style: .default) { (nil) in
            self.login()
        }
        let alertULogin = UIAlertAction(title: "否", style: .default, handler: nil)
        alertCtrl.addAction(alertLogin)
        alertCtrl.addAction(alertULogin)
        present(alertCtrl, animated:true, completion: nil)
    }
    
    func login() {
        let loginView = storyboard?.instantiateViewController(withIdentifier: "LoginView") as! LoginViewController
        loginView.delegate = self
        let nav = UINavigationController(rootViewController: loginView)
        nav.isToolbarHidden = false
        
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

extension PersonalCenterViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        
        cell?.textLabel?.text = arrList[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let text = tableView.cellForRow(at: indexPath)?.textLabel?.text
        if text == "设置" {
            let setView = storyboard?.instantiateViewController(withIdentifier: "SetView") as! SetViewController
            setView.delegate = self
            
            let nav = UINavigationController(rootViewController: setView)
            
            present(nav, animated: true)
        } else if text == "我的讨论帖" {
            if user.flag {
                let personalDetailView = storyboard?.instantiateViewController(withIdentifier: "PersonalDetailView") as! PersonalDetailViewController
                let nav = UINavigationController(rootViewController: personalDetailView)
                
                personalDetailView.navigationItem.title = "我的讨论帖"
                
                personalDetailView.imageName = "我的讨论帖.png"
                
                present(nav, animated: true, completion: nil)
            } else {
                let alertCtrl = UIAlertController(title: "提示", message: "当前账户未登录！不能使用此功能！", preferredStyle: .alert)
                let alertLogin = UIAlertAction(title: "是", style: .default) { (nil) in
                    self.login()
                }
                let alertULogin = UIAlertAction(title: "否", style: .default, handler: nil)
                alertCtrl.addAction(alertLogin)
                alertCtrl.addAction(alertULogin)
                present(alertCtrl, animated:true, completion: nil)
            }
        } else if text == "留言" {
            
            if user.flag {
                let personalDetailView = storyboard?.instantiateViewController(withIdentifier: "PersonalDetailView") as! PersonalDetailViewController
                let nav = UINavigationController(rootViewController: personalDetailView)
                
                personalDetailView.navigationItem.title = "留言"
                personalDetailView.imageName = "留言.png"
                
                present(nav, animated: true, completion: nil)
            } else {
                let alertCtrl = UIAlertController(title: "提示", message: "当前账户未登录！不能使用此功能！", preferredStyle: .alert)
                let alertLogin = UIAlertAction(title: "是", style: .default) { (nil) in
                    self.login()
                }
                let alertULogin = UIAlertAction(title: "否", style: .default, handler: nil)
                alertCtrl.addAction(alertLogin)
                alertCtrl.addAction(alertULogin)
                present(alertCtrl, animated:true, completion: nil)
            }
        } else if text == "徽章" {
            if user.flag {
                let personalDetailView = storyboard?.instantiateViewController(withIdentifier: "PersonalDetailView") as! PersonalDetailViewController
                let nav = UINavigationController(rootViewController: personalDetailView)
                
                personalDetailView.navigationItem.title = "徽章"
                personalDetailView.imageName = "徽章.png"
                
                present(nav, animated: true, completion: nil)
            } else {
                let alertCtrl = UIAlertController(title: "提示", message: "当前账户未登录！不能使用此功能！", preferredStyle: .alert)
                let alertLogin = UIAlertAction(title: "是", style: .default) { (nil) in
                    self.login()
                }
                let alertULogin = UIAlertAction(title: "否", style: .default, handler: nil)
                alertCtrl.addAction(alertLogin)
                alertCtrl.addAction(alertULogin)
                present(alertCtrl, animated:true, completion: nil)
            }
        } else if text == "关于我们" {
            let personalDetailView = storyboard?.instantiateViewController(withIdentifier: "PersonalDetailView") as! PersonalDetailViewController
            let nav = UINavigationController(rootViewController: personalDetailView)
            
            personalDetailView.navigationItem.title = "关于我们"
            personalDetailView.imageName = "关于我们.png"
            
            present(nav, animated: true, completion: nil)
        }
    }
    
}

// ------------------------------------------------------------------------
// MARK: UIImagePickerControllerDelegate
extension PersonalCenterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage]! as? UIImage {
            imageView.image = pickedImage
            
        }
        picker.dismiss(animated: true, completion: nil)
    }
}

extension PersonalCenterViewController: flushDelegate {
    func flushUserInfo() {
        setImage()
    }
}
