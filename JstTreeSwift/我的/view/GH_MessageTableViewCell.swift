//
//  GH_MessageTableViewCell.swift
//  JstTreeSwift
//
//  Created by ZhiYuan on 2019/7/19.
//  Copyright © 2019 郭徽. All rights reserved.
//

import UIKit

class GH_MessageTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.layer.cornerRadius = 5
        creatUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func creatUI(){
        contentView.addSubview(redImage)
        contentView.addSubview(titleLable)
        contentView.addSubview(timeLable)
        layou()
    }
    func layou()  {
        redImage.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView.snp.left).offset(7)
            make.top.equalTo(self.contentView).offset(20)
            make.width.height.equalTo(5)
        }
        titleLable.snp.makeConstraints { (make) in
            make.left.equalTo(redImage.snp.right).offset(10)
            make.top.equalTo(self.contentView).offset(16)
            make.width.equalTo(186)
            make.height.equalTo(14)
        }
        
        timeLable.snp.makeConstraints { (make) in
            make.right.equalTo(self.contentView.snp.right).offset(-10)
            make.top.equalTo(self.contentView.snp.top).offset(18)
            make.width.equalTo(89)
            make.height.equalTo(11)
        }
        
    }
  private  lazy var redImage : UIImageView = {
        let image = UIImageView()
        image.backgroundColor = UIColor.red
        image.layer.cornerRadius = 2.5
        image.clipsToBounds = true
        return image
    }()
    
   private lazy var titleLable : UILabel = {
        let lable = UILabel()
        lable.text = "您有一张100元优惠券待使用~"
        lable.font = fonts(R: 14)
        lable.textColor = color(R: 51, G: 51, B: 51)
        return lable
    }()
    
  private  lazy var timeLable : UILabel = {
        let lable = UILabel()
        lable.text = "2018/9/10 14:00"
        lable.font = fonts(R: 11)
        lable.textColor = color(R: 136, G: 136, B: 136)
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
