//
//  GH_My_Button.swift
//  JstTreeSwift
//
//  Created by ZhiYuan on 2019/7/19.
//  Copyright © 2019 郭徽. All rights reserved.
//

import UIKit

class GH_My_Button: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        creatUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func creatUI() {
        self.addSubview(headerImage)
        self.addSubview(titleLabels)
        self.addSubview(backImages)
        self.addSubview(lineView)
        layout()
    }
    func layout() {
        headerImage.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(22)
            make.left.equalTo(self).offset(25)
            make.width.height.equalTo(30)
        }
        
        titleLabels.snp.makeConstraints { (make) in
            make.left.equalTo(headerImage.snp.right).offset(14)
            make.top.equalTo(headerImage.snp.top).offset(8)
            make.width.equalTo(70)
            make.height.equalTo(16)
        }
        
        backImages.snp.makeConstraints { (make) in
            make.right.equalTo(self.snp.right).offset(-20)
            make.top.equalTo(headerImage.snp.top).offset(8)
            make.width.equalTo(7)
            make.height.equalTo(13)
        }
        
        lineView.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabels)
            make.top.equalTo(titleLabels.snp.bottom).offset(10)
            make.width.equalTo(210)
            make.height.equalTo(0.5)
        }
        
    }
  private  lazy var headerImage : UIImageView = {
        let images = UIImageView()
        images.layer.cornerRadius = 15
        images.clipsToBounds = true
        images.backgroundColor = UIColor.red
        return images
    }()
    
    var titleString: String? {
        didSet{
            guard let title = titleString else {
                return
            }
           titleLabels.text = title
        }
    }
    
    var imageUrl : String? {
        didSet{
            guard let url = imageUrl else {
                return
            }
            headerImage.image = UIImage.init(named: url)
        }
    }
    
    
    
  private  lazy var titleLabels: UILabel = {
        let lable = UILabel()
        lable.text = "更改密码"
        lable.font = fonts(R: 16)
        lable.textColor = color(R: 77, G: 77, B: 77)
        return lable
    }()
    
  private  lazy var backImages : UIImageView = {
        let image = UIImageView()
        image.image = UIImage.init(named: "Mine_Arrow")
        return image
    }()
    
  private  lazy var lineView : UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.gray
        return line
    }()
}
