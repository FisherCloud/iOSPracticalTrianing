//
//  RecommendViewController.swift
//  VPlayGameCommunity
//
//  Created by student on 2018/12/28.
//  Copyright © 2018年 余鑫 陈加兰 董雅蓓 陈鸿琦. All rights reserved.
//

import UIKit

class RecommendViewController: UIViewController {

    public var index: String!
    
    var arrIconName = Array<String>()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        // Do any additional setup after loading the view.

        initial()
        
        self.navigationItem.title = index!
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", style: .done, target: self, action: #selector(returnAction(_:)))
        self.navigationController?.isNavigationBarHidden = false
        
    }
    
    @objc func returnAction(_ sender: UIBarButtonItem) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    func initial() {
        let path = Bundle.main.path(forAuxiliaryExecutable: "IntroducePList.plist")
        //print("\(String(describing: path))")
        let arrDic = NSDictionary(contentsOfFile: path!)

        var dataArray = Dictionary<String, Array<String>>()

        dataArray = arrDic as! Dictionary

        var count: Int = 0
        for temp in dataArray[index]! {
            arrIconName.append("\(temp)")
            count += 1
        }

        tableView.reloadData()
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

extension RecommendViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrIconName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = arrIconName[indexPath.row]
        cell?.imageView?.image = UIImage(named: "\(arrIconName[indexPath.row])图标.png")
        
        return cell!
    }
    
}
