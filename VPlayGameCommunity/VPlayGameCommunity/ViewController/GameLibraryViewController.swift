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
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let cycleView : CycleView = CycleView(frame: CGRect(x: 0, y: 0, width: Int(UIScreen.main.bounds.width), height: 220))
        cycleView.mode = .scaleAspectFill
        
        cycleView.imageURLStringArr = arrImageName
        
        tableView.tableHeaderView = cycleView
    }

    @IBAction func moreBtnAction(_ sender: UIButton) {
        if user.flag {
            let classDetailView = storyboard?.instantiateViewController(withIdentifier: "ClassDetailView") as! ClassDetailViewController
            
            present(classDetailView, animated: true)
        } else {
            let alertCtrl = UIAlertController(title: "提示", message: "当前账户未登录！不能使用此功能！", preferredStyle: .alert)
            let alertLogin = UIAlertAction(title: "是", style: .default) { (nil) in
                let loginView = self.storyboard?.instantiateViewController(withIdentifier: "LoginView") as! LoginViewController
                loginView.delegate = self
                self.present(loginView, animated: true)
            }
            let alertULogin = UIAlertAction(title: "否", style: .default, handler: nil)
            alertCtrl.addAction(alertLogin)
            alertCtrl.addAction(alertULogin)
            present(alertCtrl, animated:true, completion: nil)
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

extension GameLibraryViewController: CycleViewDelegate, flushDelegate {
    func cycleViewDidSelectedItemAtIndex(_ index: NSInteger) {
        NSLog("cycleView selected!");
    }
    
    func flushUserInfo() {
        let classDetailView = storyboard?.instantiateViewController(withIdentifier: "ClassDetailView") as! ClassDetailViewController
        
        present(classDetailView, animated: true)
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
        
        let recommendView = RecommendViewController()
        
        recommendView.index = String(describing: (tableView.cellForRow(at: indexPath)?.textLabel?.text)!)
        recommendView.initial()
        self.navigationController?.pushViewController(recommendView, animated: true)
        
    }
}
