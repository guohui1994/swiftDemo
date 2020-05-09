//
//  GH_PersionMessageViewController.swift
//  JstTreeSwift
//
//  Created by ZhiYuan on 2019/7/19.
//  Copyright © 2019 郭徽. All rights reserved.
//

import UIKit

class GH_PersionMessageViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    var titleStringArray : NSMutableArray!
    var contentStringArray : NSMutableArray!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleStringArray = NSMutableArray()
        self.contentStringArray = NSMutableArray()
        self.titleStringArray = ["昵称", "ID", "手机号"]
        self.contentStringArray = ["杰里冬谷的旅行日记", "8", "13029840918"]
         self.view.backgroundColor = color(R: 248, G: 248, B: 248)
        self.navigationItem.title = "个人信息"
    }
    
    override func configUI() {
        self.view.addSubview(table)
    }
    
    lazy var table : UITableView = {
        let table = UITableView.init(frame: CGRect(x: 0, y: 74, width: KWidth, height: KHeight ), style: UITableView.Style.grouped)
//        UITableView.init(frame: <#T##CGRect#>, style: <#T##UITableView.Style#>)
        table.backgroundColor = UIColor.white
        table.delegate = self
    table.dataSource = self
        table.register(GH_PersionMessageTableViewCell.self, forCellReuseIdentifier: "GH_PersionMessageTableViewCell")
        table.tableHeaderView = headerView()
        return table
        
    }()

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "GH_PersionMessageTableViewCell") as! GH_PersionMessageTableViewCell
        if indexPath.row == 2 {
            cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        }
        cell.selectionStyle  = UITableViewCell.SelectionStyle.none
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        cell.titleString = (self.titleStringArray[indexPath.row] as! String)
        cell.contenString = (self.contentStringArray[indexPath.row] as! String)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = GH_MyPhoneViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func headerView() -> UIView {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: KWidth, height: 100)
        view.backgroundColor = UIColor.white
        
        view.addSubview(headerImageView)
        headerImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(view).offset(33)
            make.width.height.equalTo(60)
        }
        
        return view
    }

    lazy var headerImageView : UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 30
        image.clipsToBounds = true
        image.image = UIImage.init(named: "Mine_Icon")
        return image
    }()
    
}
