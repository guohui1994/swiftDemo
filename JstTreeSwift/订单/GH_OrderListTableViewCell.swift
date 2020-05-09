//
//  GH_OrderListTableViewCell.swift
//  JstTreeSwift
//
//  Created by ZhiYuan on 2019/7/19.
//  Copyright © 2019 郭徽. All rights reserved.
//

import UIKit
import SnapKit
class GH_OrderListTableViewCell: UITableViewCell {

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        creatUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //创建视图
    func creatUI()  {
        contentView.addSubview(headerImage)
        contentView.addSubview(statusLable)
        contentView.addSubview(titleLable)
        contentView.addSubview(addressLable)
        contentView.addSubview(pushTimeLable)
        contentView.addSubview(baoJiaTimeLable)
        contentView.addSubview(baoJiaLable)
        contentView.addSubview(clickButton)
        layout()
    }
    
    func layout() {
        headerImage.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView.snp.left).offset(12)
            make.top.equalTo(self.contentView).offset(15)
            make.width.equalTo(79)
            make.height.equalTo(75)
        }
        
        statusLable.snp.makeConstraints { (make) in
           make.centerX.equalTo(headerImage.snp.centerX)
            make.top.equalTo(headerImage.snp.bottom).offset(14)
            make.width.equalTo(headerImage.snp.width)
            make.height.equalTo(12)
        }
        
        titleLable.snp.makeConstraints { (make) in
            make.left.equalTo(headerImage.snp.right).offset(16)
            make.right.equalTo(self.contentView.snp.right).offset(-10)
            make.top.equalTo(self.contentView).offset(19)
        }
        
        addressLable.snp.makeConstraints { (make) in
            make.left.equalTo(titleLable)
            make.top.equalTo(titleLable.snp.bottom).offset(7)
        }
        pushTimeLable.snp.makeConstraints { (make) in
            make.left.equalTo(titleLable)
            make.top.equalTo(addressLable.snp.bottom).offset(7)
            make.width.equalTo(125)
            make.height.equalTo(11)
        }
        baoJiaTimeLable.snp.makeConstraints { (make) in
            make.left.equalTo(pushTimeLable.snp.right).offset(5)
            make.top.height.equalTo(pushTimeLable)
            make.width.equalTo(135)
        }
        
        baoJiaLable.snp.makeConstraints { (make) in
            make.left.equalTo(titleLable)
            make.top.equalTo(pushTimeLable.snp.bottom).offset(15)
            make.width.equalTo(109)
            make.height.equalTo(12)
        }
        
        clickButton.snp.makeConstraints { (make) in
            make.right.equalTo(self.contentView.snp.right).inset(16)
            make.top.equalTo(pushTimeLable.snp.bottom).offset(8)
            make.width.equalTo(66)
            make.height.equalTo(24)
        }
        
    }
    
    
    
  private  lazy var headerImage : UIImageView = {
        let headerImageView = UIImageView()
        headerImageView.backgroundColor = UIColor.red;
        headerImageView.layer.cornerRadius = 5
        return headerImageView
    }()
    
    
  private  lazy var titleLable : UILabel = {
        let titileLable = UILabel()
        titileLable.text = "2019第二届中国VR大会暨展览会上海 展馆"
        titileLable.font = UIFont.systemFont(ofSize: 15)
        titileLable.textColor = UIColor.init(red: 58/255.0, green: 64/255.0, blue: 68/255.0, alpha: 1.0)
        titileLable.numberOfLines = 0
        return titileLable;
    }()
    
  private  lazy var addressLable:UILabel = {
        let adressLabe = UILabel()
        adressLabe.text = "浙江省杭州市江干区佰富时代中心1幢905"
        adressLabe.font = UIFont.systemFont(ofSize: 12)
        adressLabe.textColor = color(R: 102, G: 102, B: 102)
        return adressLabe
    }()
  private  lazy var pushTimeLable:UILabel = {
        let lable = UILabel()
        lable.text = "发布时间：2019/09/05"
        lable.font = UIFont.systemFont(ofSize: 11)
        lable.textColor = color(R: 128, G: 128, B: 128)
        return lable
    }()
    
  private  lazy var baoJiaTimeLable: UILabel = {
        let lable = UILabel()
        lable.text = "报价时间：2019/09/10"
        lable.font = fonts(R: 12)
        lable.textColor = color(R: 128, G: 128, B: 128)
        return lable
    }()
    
  private  lazy var baoJiaLable:UILabel = {
        let lable = UILabel()
        lable.text = "报价: 6800.00元"
        lable.font = fonts(R: 12)
        lable.textColor = color(R: 251, G: 109, B: 53)
        return lable
    }()
    
   private lazy var clickButton :UIButton = {
        let button = UIButton()
        button .setTitle("我要撤单", for: UIControl.State.normal)
        button.setTitleColor(color(R: 254, G: 141, B: 51), for: UIControl.State.normal)
        button.titleLabel?.font = fonts(R: 12)
        button.layer.borderColor = color(R: 254, G: 141, B: 51).cgColor
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 3
        return button
    }()
    
   private  lazy var statusLable:UILabel = {
        let lable = UILabel()
        lable.text = "未通过"
        lable.font = fonts(R: 12)
        lable.textAlignment = NSTextAlignment.center
        lable.textColor = color(R: 76, G: 76, B: 76)
        return lable
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
