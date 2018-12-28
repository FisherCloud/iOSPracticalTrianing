//
//  ClassViewController.swift
//  VPlayGameCommunity
//
//  Created by student on 2018/12/28.
//  Copyright © 2018年 余鑫 陈加兰 董雅蓓 陈鸿琦. All rights reserved.
//

import UIKit

class ClassViewController: UIViewController {

    var arrDic = Dictionary<String, Array<String>>()
    var index: String = "MOBA"

    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        initial()
        //print("\(arrDic)")
        
    }
    
    func initial() {
        let path = Bundle.main.path(forAuxiliaryExecutable: "GamePList.plist")
        let arr = NSDictionary(contentsOfFile: path!)
        arrDic = arr as! Dictionary
        
        for i in 0..<4 {
            buttons[i].tag = i
            buttons[i].addTarget(self, action: #selector(btnAction(_:)), for: UIControl.Event.touchDown)
        }
    }
    
    @objc func btnAction(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            index = "MOBA"
        case 1:
            index = "休闲益智"
        case 2:
            index = "射击游戏"
        case 3:
            index = "手机游戏"
        default:
            print("\(sender.tag)")
        }
        tableView.reloadData()
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let nextView = segue.destination as! DetailViewController
        let cell = sender as! UITableViewCell
        
        nextView.name = cell.textLabel?.text!
    }
 

}

extension ClassViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrDic[index]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "DetailCell")
        }
        
        cell?.textLabel?.text = arrDic[index]![indexPath.row]
        cell?.imageView?.image = UIImage(named: "\(arrDic[index]![indexPath.row])图标.png")
        
        return cell!
    }
    
    
}
