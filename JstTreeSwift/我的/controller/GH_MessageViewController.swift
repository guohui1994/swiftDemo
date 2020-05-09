//
//  GH_MessageViewController.swift
//  JstTreeSwift
//
//  Created by ZhiYuan on 2019/7/19.
//  Copyright © 2019 郭徽. All rights reserved.
//

import UIKit

class GH_MessageViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       self.navigationItem.title = "消息"
        self.view.backgroundColor = color(R: 248, G: 248, B: 248)
    }
    
    override func configUI() {
        self.view.addSubview(table)
    }

    lazy var table : UITableView = {
        let  tables = UITableView.init(frame: CGRect(x: 15, y: 64, width: KWidth - 30, height: KHeight - 110), style: UITableView.Style.grouped)
        tables.delegate = self
        tables.dataSource = self
        tables.backgroundColor = color(R: 248, G: 248, B: 248)
        tables.register(GH_MessageTableViewCell.self, forCellReuseIdentifier: "GH_MessageTableViewCell")
        return tables
    }()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "GH_MessageTableViewCell") as! GH_MessageTableViewCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        cell.layer.cornerRadius = 5
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = GH_MessageDetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view  = UIView()
        view.frame = CGRect(x: 0, y: 0, width: tableView.width, height: 10)
        return view
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view  = UIView()
        view.frame = CGRect(x: 0, y: 0, width: tableView.width, height: 0.1)
        return view
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
}
