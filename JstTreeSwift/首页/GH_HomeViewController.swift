//
//  GH_HomeViewController.swift
//  JstTreeSwift
//
//  Created by ZhiYuan on 2019/7/18.
//  Copyright © 2019 郭徽. All rights reserved.
//

import UIKit

class GH_HomeViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "首页"
       print(KStasueHeight,KWidth, KHeight, KWidthscale(R: 30))
        
    }
    
  private  lazy var table : UITableView = {
        let table = UITableView.init(frame: CGRect(x: 0, y: 64, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.height - 64 - 44), style: UITableView.Style.plain)
    table.delegate = self
    table.dataSource = self
    table.register(GH_HomeTableViewCell.self, forCellReuseIdentifier: "123")
        return table
        
    }()
    
    override func configUI() {
        self.view.addSubview(table)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let  cell = tableView.dequeueReusableCell(withIdentifier: "123", for: indexPath) as! GH_HomeTableViewCell
        
     cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.titlString = "2019国家会展中心"
        cell.hederImageString = "http://a.hiphotos.baidu.com/lvpics/h=800/sign=2d496375d739b60052ce02b7d9513526/a6efce1b9d16fdfa97d6a678b68f8c5495ee7be9.jpg"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return self.cellHeight(for: indexPath, cellContentViewWidth: KWidth, tableView: table)
        return 140
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = GH_HomeDetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        
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
