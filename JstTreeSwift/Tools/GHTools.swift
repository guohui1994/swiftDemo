//
//  GHTools.swift
//  JstTreeSwift
//
//  Created by ZhiYuan on 2019/7/29.
//  Copyright © 2019 郭徽. All rights reserved.
//

import UIKit

class GHTools: NSObject {

    
    
    
    public func saveValueToUserDefault(object : String, key: String){
        let standarUrserDefaults = UserDefaults.init()
        standarUrserDefaults.setValue(object, forKey: key)
    }
    
 public   func getUserDefauleWithKey(key : String) -> String {
        let standarUrserDefaults = UserDefaults.init()
        return standarUrserDefaults.object(forKey: key) as! String
    }
}
