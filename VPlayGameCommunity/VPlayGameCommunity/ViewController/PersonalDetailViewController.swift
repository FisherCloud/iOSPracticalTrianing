//
//  PersonalDetailViewController.swift
//  VPlayGameCommunity
//
//  Created by student on 2018/12/28.
//  Copyright © 2018年 余鑫 陈加兰 董雅蓓 陈鸿琦. All rights reserved.
//

import UIKit

class PersonalDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var imageName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.isToolbarHidden = false
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", style: .done, target: self, action: #selector(returnBarButtonItemAction(_:)))
        
        imageView.contentMode = .scaleAspectFill
        if imageName == "关于我们.png" {
            let textView = UITextView(frame: UIScreen.main.bounds)
            textView.textAlignment = .left
            textView.font = UIFont.systemFont(ofSize: 40)
            textView.text = "\r\n\r\n\r\nVPlay游戏社区\r\n开发者信息：\r\n学号        姓名\r\n2016110204 陈鸿琦\r\n2016110205 陈加兰\r\n2016110209 董雅蓓\r\n2016110252     余鑫\r\n"
            self.view.addSubview(textView)
        } else {
            //let path = Bundle.main.path(forAuxiliaryExecutable: "\(String(describing: imageName))")
            //print("\(path)")
            imageView.image = UIImage(named: imageName)
        }
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
