//
//  GH_OrderViewController.swift
//  JstTreeSwift
//
//  Created by ZhiYuan on 2019/7/18.
//  Copyright © 2019 郭徽. All rights reserved.
//

import UIKit

class GH_OrderViewController: BaseViewController, TopDelegate , UITableViewDelegate, UITableViewDataSource{

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "订单"
        let topView = GH_OrderListTopView()
        topView.frame = CGRect(x: 15, y: KNavHeight + 10 , width: 345, height: 40)
        topView.delegate = self
        
//        self.view.addSubview(table)
        self.view.addSubview(topView)
    }
    
    override func configUI() {
        self.view.addSubview(table)
    }
    
  private  lazy var table : UITableView = {
//        var tables = UITableView()
      let  tables  = UITableView.init(frame: CGRect(x: 0, y:114, width: KWidth, height: KHeight - 124 - 44), style: UITableView.Style.plain)
        tables.delegate = self
        tables.dataSource = self
        tables.register(GH_OrderListTableViewCell.self, forCellReuseIdentifier: "GH_OrderListTableViewCell")
        return tables
    }()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GH_OrderListTableViewCell") as! GH_OrderListTableViewCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135
    }
    
    //topview的点击回调
    func topIndex(index: Int) {
        print(index)
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
