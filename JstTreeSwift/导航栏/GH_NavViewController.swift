//
//  GH_NavViewController.swift
//  JstTreeSwift
//
//  Created by ZhiYuan on 2019/7/18.
//  Copyright © 2019 郭徽. All rights reserved.
//

import UIKit

class GH_NavViewController: UINavigationController, UIGestureRecognizerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        self.interactivePopGestureRecognizer?.delegate = self as UIGestureRecognizerDelegate;
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if self.children.count == 1 {
            return false;
        }
        return true;
    }
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.children.count > 0 {
            self.interactivePopGestureRecognizer?.delegate = nil;
            viewController.hidesBottomBarWhenPushed = true;
            let leftButton = UIButton()
            leftButton.frame = CGRect(x: 20, y: 10, width: 30, height: 30)
            leftButton.setImage(UIImage.init(named: "navigator_btn_back"), for: UIControl.State.normal)
            leftButton.addTarget(self, action:#selector(back) , for: UIControl.Event.touchDown)
            let LeftBarButton  = UIBarButtonItem.init(customView: leftButton)
            viewController.navigationItem.leftBarButtonItem = LeftBarButton
        }
       
        super.pushViewController(viewController, animated: true)
    }
    
    @objc func back()  {
        self.popViewController(animated: true)
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
