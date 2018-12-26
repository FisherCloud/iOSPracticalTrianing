//
//  PersonalCenterViewController.swift
//  CocoGameCommunity
//
//  Created by student on 2018/12/26.
//  Copyright © 2018年 余鑫. All rights reserved.
//

import UIKit

class PersonalCenterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var arrList = ["徽章", "我的讨论帖", "留言", "等级", "关注的游戏", "设置", "关于我们"]
    
    var tableView: UITableView!
    var imageView: UIImageView!
    var width = 80
    var height = 80
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        
        imageView = UIImageView(frame: CGRect(x: (Int(self.view.bounds.width) - width) / 2, y: 40, width: width, height: height))
        imageView.image = UIImage(named: "community.png")
        
        tableView = UITableView(frame: CGRect(x: 0, y: CGFloat(height + 50), width: self.view.bounds.width, height: self.view.bounds.height), style: UITableView.Style.plain)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.view.addSubview(tableView)
        self.view.addSubview(imageView)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        
        cell?.textLabel?.text = arrList[indexPath.row]
        
        cell?.accessoryType = .disclosureIndicator
        
        return cell!
    }
    
    
}
