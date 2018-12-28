//
//  ClassDetailViewController.swift
//  VPlayGameCommunity
//
//  Created by 506 on 2018/12/28.
//  Copyright © 2018年 余鑫 陈加兰 董雅蓓 陈鸿琦. All rights reserved.
//

import UIKit

class ClassDetailViewController: UIViewController {

    var dataSource = Dictionary<String, Dictionary<String, String>>()
    var index = "端游排行榜"
    var dataDic = Array<Dictionary<String, Any>>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        initial()
    }
    
    @IBAction func returnBtnAction(_ sender: UIBarButtonItem) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    func initial() {
        let path = Bundle.main.path(forAuxiliaryExecutable: "RankingPList.plist")
        let arrDic = NSDictionary(contentsOfFile: "\(path!)") as! Dictionary<String, Dictionary<String, String>>
        dataSource = arrDic
        //print("\(dataSource)")
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

extension ClassDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[index]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RankingCell") as! RankingTableViewCell
        
        cell.rankingLabel.text = "NO.\(indexPath.row + 1)"
        
        return cell
    }
    
    
}
