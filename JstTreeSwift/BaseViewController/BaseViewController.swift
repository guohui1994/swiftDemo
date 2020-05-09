//
//  BaseViewController.swift
//  JstTreeSwift
//
//  Created by ZhiYuan on 2019/7/18.
//  Copyright © 2019 郭徽. All rights reserved.
//

import UIKit





class BaseViewController: UIViewController {
    let KWidth = UIScreen.main.bounds.size.width
    let KHeight = UIScreen.main.bounds.size.height
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
self.view.backgroundColor = UIColor.white
//        let img = UIImage.init(named: "")
//        self.navigationController?.navigationBar.setBackgroundImage(img, for: UIBarMetrics.default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//
        
      configUI()
    }
    public func configUI(){
        
    }

    public func  Layout(){
        
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
