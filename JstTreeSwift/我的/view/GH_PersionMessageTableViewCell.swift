//
//  GH_PersionMessageTableViewCell.swift
//  JstTreeSwift
//
//  Created by ZhiYuan on 2019/7/19.
//  Copyright © 2019 郭徽. All rights reserved.
//

import UIKit

class GH_PersionMessageTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        creatUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func creatUI()  {
        contentView.addSubview(nameLable)
        contentView.addSubview(contenLable)
        contentView.addSubview(backImage)
        layout()
    }
    func layout()  {
        nameLable.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(15)
            make.top.equalTo(self.contentView).offset(21)
            make.width.equalTo(84)
            make.height.equalTo(14)
        }
        
        contenLable.snp.makeConstraints { (make) in
            make.right.equalTo(self.contentView.snp.right).offset(-15)
            make.top.equalTo(self.contentView.snp.top).offset(20)
            make.height.equalTo(14)
        }
        
    }
    
    var titleString : String? {
        didSet{
            guard let title = titleString else {
                return
            }
            nameLable.text = title
        }
    }
    
    var contenString : String? {
        didSet{
            guard  let content = contenString else {
                return
            }
            contenLable.text = content
        }
    }
    
    
    
    
  private  lazy var nameLable :UILabel = {
        let lable = UILabel()
        lable.text = "昵称"
        lable.font = fonts(R: 15)
        lable.textColor = color(R: 51, G: 51, B: 51)
        return lable
    }()
    
    private lazy var contenLable : UILabel = {
        let lable = UILabel()
        lable.text = "杰里冬谷的旅行日记"
        lable.textColor = color(R: 102, G: 102, B: 102)
        lable.font = fonts(R: 15)
        return lable
    }()
    
    
    lazy var backImage : UIImageView = {
        let images = UIImageView()
        images.image = UIImage.init(named: "Mine_Arrow")
        return images
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
