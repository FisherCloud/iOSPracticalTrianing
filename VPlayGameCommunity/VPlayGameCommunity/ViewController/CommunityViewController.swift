//
//  CommunityViewController.swift
//  VPlayGameCommunity
//
//  Created by student on 2018/12/27.
//  Copyright © 2018年 余鑫 陈加兰 董雅蓓 陈鸿琦. All rights reserved.
//

import UIKit

class CommunityViewController: UIViewController {

    var dataSource = Array<Dictionary<String, String>>()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
 
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initial()
    }

    func initial() {
        let path = Bundle.main.path(forAuxiliaryExecutable: "LuntanPlist.plist")
        dataSource = NSArray(contentsOfFile: "\(path!)") as! Array
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let nextView = segue.destination as! TalkDetailViewController
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        print("\(indexPath.row)")
        print("\(dataSource[(indexPath.row)]["xiangqing"]!)")
        let image = UIImage(named: "\((dataSource[(indexPath.row)]["xiangqing"])!)")!
        nextView.image = image
    }
 

}

extension CommunityViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TalkDetailCell") as! CommunityTableViewCell
        
        let path = Bundle.main.path(forAuxiliaryExecutable: "\((dataSource[indexPath.row]["text"])!)")
        let text = try! String(contentsOfFile: "\(path!)")
        //print("\(text)")
        cell.nameLabel.text = text
        cell.nameLabel.numberOfLines = 0
        cell.headerImageView.contentMode = .scaleAspectFit
        let image = UIImage(named: dataSource[indexPath.row]["xiaotu"]!)
        cell.headerImageView.image = image
        
        return cell
    }
    
    
}
