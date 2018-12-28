//
//  DetailViewController.swift
//  VPlayGameCommunity
//
//  Created by student on 2018/12/28.
//  Copyright © 2018年 余鑫 陈加兰 董雅蓓 陈鸿琦. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var name: String!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initial()
    }
    
    func initial() {
        print("\(name!)")
        let path = Bundle.main.path(forAuxiliaryExecutable: "\(name!).txt")
        print("\(path!)")
        let text = try! String(contentsOfFile: path!)
        imageView.image = UIImage(named: "\(String(describing: name!)).png")
        imageView.contentMode = .scaleAspectFill
        textView.font = UIFont.systemFont(ofSize: 24)
        textView.text = text
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
