//
//  FriendViewController.swift
//  VPlayGameCommunity
//
//  Created by student on 2018/12/27.
//  Copyright © 2018年 余鑫 陈加兰 董雅蓓 陈鸿琦. All rights reserved.
//

import UIKit

class FriendViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrFriend = Array<Global.User>()
    var sqlitedb: SQLiteDB!
    
    override func viewDidLoad() {

        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
        sqlitedb = SQLiteDB.shared
        _ = sqlitedb.openDB()
        
        
        readData()
    }

    func readData() {
        let sql = "select * from User;"
        let res = sqlitedb.query(sql: sql)
        for item in res {
            var userTemp = Global.User()
            userTemp.id = item["id"] as! String
            userTemp.name = item["name"] as! String
            userTemp.grade = item["grade"] as! Int
            arrFriend.append(userTemp)
        }
        //print("\(arrFriend)")
        tableView.reloadData()
    }
    
    @IBAction func addFriendBtnAction(_ sender: UIBarButtonItem) {
        let addView = storyboard?.instantiateViewController(withIdentifier: "AddFriendView") as! AddFriendViewController
        
        addView.delegate = self
        
        let nav = UINavigationController(rootViewController: addView)
        
        present(nav, animated: true)
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

extension FriendViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrFriend.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        
        cell?.imageView?.contentMode = .scaleAspectFit
        cell?.imageView?.image = UIImage(named: "8.png")
        cell?.textLabel?.text = "姓名：\(arrFriend[indexPath.row].name)"
        cell?.detailTextLabel?.text = "等级：\(arrFriend[indexPath.row].grade)"
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let friendDetailView = storyboard?.instantiateViewController(withIdentifier: "FriendDetailView") as! FriendDetailViewController
        friendDetailView.imageName = "8.png"
        friendDetailView.text = "账号：\(arrFriend[indexPath.row].id)\r\n\((tableView.cellForRow(at: indexPath)?.textLabel?.text)!)\r\n\((tableView.cellForRow(at: indexPath)?.detailTextLabel?.text)!)"
        
        let nav = UINavigationController(rootViewController: friendDetailView)
        
        present(nav, animated: true)
    }
}

extension FriendViewController: flushDelegate {
    func flushUserInfo() {
        self.readData()
    }
}
