//
//  Global.swift
//  VPlayGameCommunity
//
//  Created by student on 2018/12/28.
//  Copyright © 2018年 余鑫 陈加兰 董雅蓓 陈鸿琦. All rights reserved.
//

import Foundation

enum Sex {
    case male
    case female
}

class Global {
    
    struct Post {
        var username: String
        var time: Date
        var arrImageName: String
        var text: String
    }
    
    struct MessageBoard {
        var fromName: String
        var time: Date
        var text: String
    }
    
    /*
     create table User
     (
         name varchar(50),
         sex char(4),
         age int,
         grade int,
         password char(30)
     )
     */
    
    struct User {
        var name: String = "请登录"
        var id: String = "2016110000"
        var sex: Sex = Sex.female
        var age: Int = 0
        var grade: Int = 1
        var badge =  Array<String>()
        var flag: Bool = false
        var post = Array<Global.Post>()
        var messageBoard = Array<Global.MessageBoard>()
    }
    
}

// 全局变量
var user: Global.User = Global.User()
