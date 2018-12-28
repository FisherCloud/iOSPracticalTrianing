//
//  RecommendViewController.swift
//  VPlayGameCommunity
//
//  Created by student on 2018/12/28.
//  Copyright © 2018年 余鑫 陈加兰 董雅蓓 陈鸿琦. All rights reserved.
//

import UIKit

class RecommendViewController: UIViewController {

    var index: String!
    var dataArray = Dictionary<String, Array<String>>()
    var arrImageName = Array<String>()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let path = Bundle.main.path(forAuxiliaryExecutable: "IntroducePList.plist")
        //print("\(String(describing: path))")
        let arrDic = NSDictionary(contentsOfFile: path!)
        dataArray = arrDic as! Dictionary
        print("\(String(describing: index))")
        print("\(String(describing: dataArray))")
        for temp in dataArray[index]! {
            arrImageName.append("\(temp).png")
        }
        
        let cycleView: CycleView = CycleView(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: tableView.bounds.height))
        cycleView.mode = .scaleAspectFill
        
        cycleView.imageURLStringArr = arrImageName
        
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

extension RecommendViewController: UITableViewDataSource, UIToolbarDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //var cell =
        return UITableViewCell(style: .default, reuseIdentifier: "cell")
    }
    
    
}
