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

        imageView.image = UIImage(named: "community.png")
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
