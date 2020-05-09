//
//  GH_HomeTableViewCell.swift
//  JstTreeSwift
//
//  Created by ZhiYuan on 2019/7/18.
//  Copyright © 2019 郭徽. All rights reserved.
//

import UIKit
import SDAutoLayout
import SnapKit
import SDWebImage
class GH_HomeTableViewCell: UITableViewCell {
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.creatUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func creatUI() {
        self.contentView.addSubview(headerImages)
        self.contentView.addSubview(titleLable)
        self.contentView.addSubview(timeImageView)
        self.contentView.addSubview(timeLable)
        self.contentView.addSubview(companyLable)
        self.contentView.addSubview(bianHaoLable)
        self.contentView.addSubview(arerLable)
        self.contentView.addSubview(otherLable)
        self.contentView.addSubview(pushTimeLable)
        self.layout()
    }
    
    func layout()  {
//      _ =  headerImages.sd_layout()?
//        .leftSpaceToView(self.contentView, 12)?
//        .topSpaceToView(self.contentView,6)?
//        .widthIs(130)?
//        .heightIs(120);
        
        headerImages.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(12)
            make.top.equalTo(self.contentView).offset(6)
            make.width.equalTo(130)
            make.height.equalTo(120)
            
        }
        
//        _ = titleLable.sd_layout()?
//            .leftSpaceToView(headerImages, 13)?
//            .topSpaceToView(self.contentView, 8)?
//            .rightSpaceToView(self.contentView, 10)?
//            .heightIs(15)
        
        titleLable.snp.makeConstraints { (make) in
            make.left.equalTo(headerImages.snp.right).offset(13)
            make.top.equalTo(self.contentView.snp.top).offset(8)
            make.right.equalTo(self.contentView.snp.right).inset(10)
            make.height.equalTo(15)
        }
        
//        _ = timeImageView.sd_layout()?
//            .leftEqualToView(titleLable)?
//            .topSpaceToView(titleLable, 7)?
//            .widthIs(14)?
//            .heightIs(14);
        
        timeImageView.snp.makeConstraints {
            $0.left.equalTo(titleLable.snp.left)
            $0.top.equalTo(titleLable.snp.bottom).offset(7)
            $0.width.equalTo(14)
            $0.height.equalTo(14)
        }
        
        
        
//        _=timeLable.sd_layout()?
//            .leftSpaceToView(timeImageView, 6)?
//            .topSpaceToView(titleLable, 8)?
//            .rightSpaceToView(self.contentView, 10)?
//            .heightIs(12)
//
        
        timeLable.snp.makeConstraints{
            $0.left.equalTo(timeImageView.snp.right).offset(6)
            $0.top.equalTo(titleLable.snp.bottom).offset(8)
            $0.right.equalTo(self.contentView.snp.right).inset(10)
            $0.height.equalTo(12)
        }
        
//        _=companyLable.sd_layout()?
//            .leftEqualToView(titleLable)?
//            .topSpaceToView(timeLable, 8)?
//            .rightSpaceToView(self.contentView, 10)?
//            .heightIs(14)
        
        
        companyLable.snp.makeConstraints { (make) in
            make.left.equalTo(titleLable)
            make.top.equalTo(timeLable.snp.bottom).offset(8)
            make.right.equalTo(self.contentView.snp.right).inset(10)
            make.height.equalTo(14)
        }
        
//        _ = bianHaoLable.sd_layout()?
//            .leftEqualToView(titleLable)?
//            .topSpaceToView(companyLable, 10)?
//            .widthIs(104)?
//            .heightIs(12)
        
        bianHaoLable.snp.makeConstraints { (make) in
            make.left.equalTo(titleLable)
            make.top.equalTo(companyLable.snp.bottom).offset(10)
            make.width.equalTo(104)
            make.height.equalTo(12)
        }
        
//        _=arerLable.sd_layout()?
//            .leftSpaceToView(bianHaoLable, 10)?
//            .topEqualToView(bianHaoLable)?
//            .widthIs(bianHaoLable.width)?
//            .heightIs(bianHaoLable.height)
        
        
        arerLable.snp.makeConstraints { (make) in
            make.left.equalTo(bianHaoLable.snp.right).offset(10)
            make.top.equalTo(bianHaoLable)
            make.width.equalTo(bianHaoLable.snp.width)
            make.height.equalTo(bianHaoLable.snp.height)
        }
        
//        _=otherLable.sd_layout()?
//            .leftEqualToView(titleLable)?
//            .topSpaceToView(bianHaoLable, 10)?
//            .rightSpaceToView(self.contentView, 10)?
//            .heightIs(12)
        
        otherLable.snp.makeConstraints { (make) in
            make.left.equalTo(titleLable)
            make.top.equalTo(bianHaoLable.snp.bottom).offset(10)
            make.right.equalTo(self.contentView.snp.right).inset(10)
            make.height.equalTo(12)
        }
        
//        _ = pushTimeLable.sd_layout()?
//            .leftEqualToView(titleLable)?
//            .topSpaceToView(otherLable, 10)?
//            .rightSpaceToView(self.contentView, 10)?
//            .heightIs(12)
//
        pushTimeLable.snp.makeConstraints { (make) in
            make.left.equalTo(titleLable)
            make.top.equalTo(otherLable.snp.bottom).offset(10)
            make.right.equalTo(self.contentView.right).inset(10)
            make.height.equalTo(12)
        }
        
//        self.setupAutoHeight(withBottomView: pushTimeLable, bottomMargin: 10)
    }
    
    var titlString : NSString? {
        didSet{
            guard let string = titlString else {
                return
            }
            titleLable.text = string as String
        }
    }
    var hederImageString: NSString? {
        didSet{
            guard let headerUrl = hederImageString else {
                return
            }
            
            headerImages.sd_setImage(with: (NSURL.init(string: headerUrl as String)! as URL), completed: nil)
        }
    }
    
    
    
  private  lazy var headerImages : UIImageView = {
        let headerImages = UIImageView()
    headerImages.layer.cornerRadius = 10
    headerImages.clipsToBounds = true
    headerImages.backgroundColor = UIColor.red
        return headerImages
    }()
    
  private  lazy var titleLable : UILabel = {
        let titleLables = UILabel()
//        titleLables.font = UIFont.systemFont(ofSize: 15)
        titleLables.font = UIFont.init(name: "Helvetica-Bold", size: 15)
        titleLables.textColor = UIColor.init(red: 6/255.0, green: 27/255.0, blue: 40/255.0, alpha: 1.0)
        titleLables.text = "2019国家会展中心"
        return titleLables
    }()
    
   private lazy var timeImageView : UIImageView = {
        let timeImageView  = UIImageView()
        timeImageView.backgroundColor = UIColor.red;
        timeImageView.image = UIImage.init(named: "Home_time")
        timeImageView.layer.cornerRadius = 7
        timeImageView.clipsToBounds = true
        return timeImageView
    }()
    
  private  lazy var timeLable:UILabel = {
        let timeLable = UILabel()
        timeLable.text = "2019/09/20-10/26"
        timeLable.font = UIFont.systemFont(ofSize: 13)
        timeLable.textColor = UIColor.init(red: 255/255.0, green: 68/255.0, blue: 0/255.0, alpha: 1.0)
        return timeLable
    }()
    
   private lazy var companyLable : UILabel={
        let companLable = UILabel()
        companLable.text = "发布：上海雅树展览有限公司"
        companLable.font = UIFont.systemFont(ofSize: 14)
        companLable.textColor = UIColor.init(red: 6/255.0, green: 27/255.0, blue: 40/255.0, alpha: 1.0)
        return companLable
    }()
    
   private  lazy var bianHaoLable : UILabel = {
        let  bianHaoLable = UILabel()
        bianHaoLable.text = "项目编号：SE2775"
        bianHaoLable.font = UIFont.systemFont(ofSize: 12)
        bianHaoLable.textColor = UIColor.init(red: 102/255.0, green: 102/255.0, blue: 102/255.0, alpha: 1.0)
        return bianHaoLable
    }()
    
  private  lazy var arerLable : UILabel = {
        let  arerLable = UILabel()
        arerLable.text = "展位面积: 888㎡"
        arerLable.font = UIFont.systemFont(ofSize: 12)
        arerLable.textColor = UIColor.init(red: 102/255.0, green: 102/255.0, blue: 102/255.0, alpha: 1.0)
        return arerLable
    }()
    
  private  lazy var otherLable:UILabel = {
        let otherLable = UILabel()
        otherLable.text = "其他要求：不知道"
        otherLable.font = UIFont.systemFont(ofSize: 12)
        otherLable.textColor = UIColor.init(red: 153/255.0, green: 153/255.0, blue: 153/255.0, alpha: 1.0)
        return otherLable
    }()
    
 private   lazy var pushTimeLable : UILabel = {
        let pushTimeLable = UILabel()
        pushTimeLable.text = "发布时间:  2019/09/10  14:00"
        pushTimeLable.textColor = UIColor.init(red: 153/255.0, green: 153/255.0, blue: 153/255.0, alpha: 1.0)
        pushTimeLable.font = UIFont.systemFont(ofSize: 12)
        return pushTimeLable
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
