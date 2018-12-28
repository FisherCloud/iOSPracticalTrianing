//
//  RecommendViewController.swift
//  VPlayGameCommunity
//
//  Created by student on 2018/12/28.
//  Copyright © 2018年 余鑫 陈加兰 董雅蓓 陈鸿琦. All rights reserved.
//

import UIKit

protocol RecommendViewControllerDelegate {
    func setIndex(_ Index: String)
}

class RecommendViewController: UIViewController {

    public var index: String!
    
    var arrImageName = Array<String>()
    var arrIconName = Array<String>()
    
    public var delegate: RecommendViewControllerDelegate?
    
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        // Do any additional setup after loading the view.
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        self.view.addSubview(tableView)
        
        // 轮播图
        let cycleView : CycleView = CycleView(frame: CGRect(x: 0, y: 0, width: Int(UIScreen.main.bounds.width), height: 220))
        cycleView.mode = .scaleAspectFill
        
        cycleView.imageURLStringArr = arrImageName
        
        tableView.tableHeaderView = cycleView
    }
    
    func initial() {
        let path = Bundle.main.path(forAuxiliaryExecutable: "IntroducePList.plist")
        //print("\(String(describing: path))")
        let arrDic = NSDictionary(contentsOfFile: path!)
        
        var dataArray = Dictionary<String, Array<String>>()
        
        dataArray = arrDic as! Dictionary
        //print("\(String(describing: index))")
        //print("\(String(describing: dataArray))")
        
        var count: Int = 0
        for temp in dataArray[index]! {
            if count >= 3 {
                arrIconName.append("\(temp)")
            } else {
                arrImageName.append("\(temp).png")
            }
            count += 1
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}

extension RecommendViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrIconName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        
        print("\(arrIconName[indexPath.row])")
        
        cell?.textLabel?.text = arrIconName[indexPath.row]
        cell?.imageView?.image = UIImage(named: "\(arrIconName[indexPath.row])图标.png")
        
        return cell!
    }
    
}
