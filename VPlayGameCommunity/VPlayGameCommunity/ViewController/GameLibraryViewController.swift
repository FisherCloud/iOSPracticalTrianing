//
//  GameLibraryViewController.swift
//  VPlayGameCommunity
//
//  Created by student on 2018/12/27.
//  Copyright © 2018年 余鑫 陈加兰 董雅蓓 陈鸿琦. All rights reserved.
//

import UIKit

class GameLibraryViewController: UIViewController {
    
    var arrImage = ["英雄联盟.png", "小黄人快跑.png", "守望先锋.png", "刺激战场.png"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let pointY = 40
        let cycleView : CycleView = CycleView(frame: CGRect(x: 0, y: pointY, width: Int(UIScreen.main.bounds.width), height: 220))
        cycleView.mode = .scaleAspectFill
        
        cycleView.imageURLStringArr = arrImage
        
        tableView.tableHeaderView = cycleView
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

extension GameLibraryViewController: CycleViewDelegate {
    func cycleViewDidSelectedItemAtIndex(_ index: NSInteger) {
        
    }
}

extension GameLibraryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        
        return cell!
    }
}
