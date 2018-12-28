//
//  PersonalCenterViewController.swift
//  VPlayGameCommunity
//
//  Created by student on 2018/12/27.
//  Copyright © 2018年 余鑫 陈加兰 董雅蓓 陈鸿琦. All rights reserved.
//

import UIKit

class PersonalCenterViewController: UIViewController {

    var arrList = ["徽章", "我的讨论帖", "留言", "等级", "关注的游戏", "设置", "关于我们"]
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {

        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setImage()
        
        imageView.layer.cornerRadius = imageView.bounds.size.width / 2.0
        imageView.layer.masksToBounds = true
    }
    
    @IBAction func btnAction(_ sender: UIBarButtonItem) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func setImage() {
        if user.flag {
            imageView.image = UIImage(named: "\(user.name).png")
        } else {
            alertUnLogin("当前账户未登录！有些功能将无法使用！")
            imageView.image = UIImage(named: "unLogin.png")
        }
    }
    
    func alertUnLogin(_ message: String) {
        let alertCtrl = UIAlertController(title: "提示", message: message, preferredStyle: .alert)
        let alertLogin = UIAlertAction(title: "是", style: .default, handler: nil)
        let alertULogin = UIAlertAction(title: "否", style: .default, handler: nil)
        alertCtrl.addAction(alertLogin)
        alertCtrl.addAction(alertULogin)
        present(alertCtrl, animated:true, completion: nil)
    }
    
    func login() {
        let loginView = LoginViewController()
        
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
