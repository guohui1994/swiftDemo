//
//  GH_OrderListTopView.swift
//  JstTreeSwift
//
//  Created by ZhiYuan on 2019/7/19.
//  Copyright © 2019 郭徽. All rights reserved.
//

import UIKit

protocol TopDelegate {
    func topIndex(index: Int)
}

class GH_OrderListTopView: UIView {

    var delegate : TopDelegate!
    var titleLableArray : NSMutableArray!
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.init(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1.0)
        self.layer.cornerRadius = 5
        self.titleLableArray = NSMutableArray()
        creatUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func creatUI()  {
        let titleArray = ["全部", "已报价", "进行中", "已完成"]
        
        
        for i in 0...3 {
            let titleButton = UIButton()
            titleButton.frame = CGRect(x: 345 / 4 * i, y: 0, width: 345 / 4, height: 40)
            titleButton.setTitle(titleArray[i], for: UIControl.State.normal)
            titleButton.setTitleColor(UIColor.init(red: 90/255.0, green:  90/255.0, blue:  90/255.0, alpha: 1.0), for: UIControl.State.normal)
            titleButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            titleButton.tag = 9527 + i
            titleButton.addTarget(self, action: #selector(clickButton), for: UIControl.Event.touchDown)
            self.addSubview(titleButton)
            
            let lable = UILabel()
            lable.layer.cornerRadius = 2
            lable.tag = 10000 + i
            lable.backgroundColor = UIColor.init(red: 251/255.0, green: 109/255.0, blue: 53/255.0, alpha: 1.0)
            if i == 0{
                lable.isHidden = false
            }else{
                lable.isHidden = true
            }
            self.addSubview(lable)
            lable.snp.makeConstraints { (make) in
                make.centerX.equalTo(titleButton.centerX)
               make.centerY.equalTo(titleButton.centerY).offset(35)
                make.width.equalTo(16)
                make.height.equalTo(3)
            }
            self.titleLableArray.add(lable)
            
        }
        
        layout()
    }
    
    func layout() {
        
    }
    
    @objc func clickButton(sender:UIButton){
        let lables = self.viewWithTag(sender.tag - 9527 + 10000)
        
        
        for i in 0...self.titleLableArray.count - 1 {
            let lable = self.titleLableArray[i] as! UILabel
            if lable == lables{
                lable.isHidden = false
            }else{
                lable.isHidden = true
            }

        }

        
        self.delegate.topIndex(index: sender.tag - 9527)
    
    }
    
    
    
}
