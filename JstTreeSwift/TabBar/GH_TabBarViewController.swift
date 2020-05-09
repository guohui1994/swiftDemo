//
//  GH_TabBarViewController.swift
//  JstTreeSwift
//
//  Created by ZhiYuan on 2019/7/18.
//  Copyright © 2019 郭徽. All rights reserved.
//

import UIKit

class GH_TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().isTranslucent = false
        self.setUpChildViewControllers()
    }
    
    func setUpChildViewControllers() {
       self.setUpChildVC(vc: GH_HomeViewController(), title: "首页", image: "tabbar_home_nor", selectImage: "tabbar_home_sel")
        self.setUpChildVC(vc: GH_OrderViewController(), title: "订单", image: "tabbar_order_nor", selectImage: "tabbar_order_sel")
        self.setUpChildVC(vc: GH_MyViewController(), title: "我的", image: "tabbar_mine_nor", selectImage: "tabbar_mine_sel")
    }
    
    func setUpChildVC(vc:UIViewController, title:NSString, image:NSString, selectImage:NSString)  {
        vc.title = title as String
        vc.tabBarItem.image = UIImage.init(named: image as String)
        vc.tabBarItem.selectedImage =  UIImage.init(named: selectImage as String)?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.gray], for: UIControl.State.normal)
        vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], for: UIControl.State.selected)
        let nav = GH_NavViewController.init(rootViewController: vc)
        self.addChild(nav)
        
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
