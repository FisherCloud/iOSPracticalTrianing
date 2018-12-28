//
//  GameLibraryViewController.swift
//  VPlayGameCommunity
//
//  Created by student on 2018/12/27.
//  Copyright © 2018年 余鑫 陈加兰 董雅蓓 陈鸿琦. All rights reserved.
//

import UIKit

class GameLibraryViewController: UIViewController {
    
    var arrRecommend = ["热门游戏" , "最新上架", "促销游戏"]
    
    var arrImageName = ["英雄联盟.png", "小黄人快跑.png", "守望先锋.png", "刺激战场.png"]
    
    var index: String!
    
    var cellBuf: UITableViewCell?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let cycleView : CycleView = CycleView(frame: CGRect(x: 0, y: 0, width: Int(UIScreen.main.bounds.width), height: 220))
        cycleView.mode = .scaleAspectFill
        
        cycleView.imageURLStringArr = arrImageName
        
        tableView.tableHeaderView = cycleView
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let NextView = segue.destination as! RecommendViewController
        
        switch index {
        case "Optional(\"热门游戏\")":
            NextView.index = "热门游戏"
        case "Optional(\"最新上架\")":
            NextView.index = "最新上架"
        case "Optional(\"促销游戏\")":
            NextView.index = "促销游戏"
        default:
            NextView.index = ""
        }
    }
 

}

extension GameLibraryViewController: CycleViewDelegate {
    func cycleViewDidSelectedItemAtIndex(_ index: NSInteger) {
        NSLog("cycleView selected!");
    }
}

extension GameLibraryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.height / 3.0;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "RecommendCell")

        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "RecommendCell")
        }
        
        cell?.textLabel?.text = arrRecommend[indexPath.row]

        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = tableView.cellForRow(at: indexPath)?.textLabel?.text
        //print("\(String(describing: index))")
    }
}
