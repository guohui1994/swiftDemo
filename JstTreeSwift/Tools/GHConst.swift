//
//  GHConst.swift
//  JstTreeSwift
//
//  Created by ZhiYuan on 2019/7/18.
//  Copyright © 2019 郭徽. All rights reserved.
//

import UIKit
import MBProgressHUD
import Foundation
let KWidth = UIScreen.main.bounds.size.width
let KHeight = UIScreen.main.bounds.size.height
let KStasueHeight = UIApplication.shared.statusBarFrame.size.height
let KNavHeight = KStasueHeight == 44.0 ? 88 : 64


public func KWidthscale(R:CGFloat) -> CGFloat {
 return    R * KWidth / 375
}

public func KHeightScale(R:CGFloat) -> CGFloat{
    return R * KHeight / 667
}

public func jianBianButton(text : String) -> UIButton{
    let button = UIButton()
    let layer = CAGradientLayer()
    layer.colors = [color(R: 254, G: 142, B: 51).cgColor, color(R: 251, G: 109, B: 53).cgColor]
    layer.frame = CGRect(x: 0, y: 0, width: 288, height: 47)
    layer.locations = [0.0, 0.7, 1.0];
    layer.startPoint = CGPoint(x: 0.0, y: 0.0);
    layer.endPoint = CGPoint(x: 1.0, y: 0.0);
    button.layer.addSublayer(layer)
    button.setTitle(text, for: UIControl.State.normal)
    button.setTitleColor(UIColor.white, for: UIControl.State.normal)
    button.titleLabel?.font = fonts(R: 18)
    button.layer.cornerRadius = 7
    button.clipsToBounds = true

    return button
    
}

//public func color(R:CGFloat)->CGFloat{
//    return R/255.0
//}

public func color(R:CGFloat, G:CGFloat, B:CGFloat)->UIColor{
    return   UIColor.init(red: R/255.0, green: G/255.0, blue: B/255.0, alpha: 1.0)
}

public func fonts(R:CGFloat)->UIFont{
    return  UIFont.systemFont(ofSize: R)
}

public func MBprogressHud(text : String)  {
    let hud = MBProgressHUD()
    UIApplication.shared.keyWindow?.addSubview(hud)
    hud.label.text = text
    hud.show(animated: true)
    hud.hide(animated: true, afterDelay: 2)
}

public func saveValueToUserDefault(object : String, key: String){
    let standarUrserDefaults = UserDefaults.init()
    standarUrserDefaults.setValue(object, forKey: key)
}

public   func getUserDefauleWithKey(key : String) -> String {
    let standarUrserDefaults = UserDefaults.init()
    return standarUrserDefaults.object(forKey: key) as! String
}
