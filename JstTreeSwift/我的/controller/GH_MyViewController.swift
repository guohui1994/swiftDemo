//
//  GH_MyViewController.swift
//  JstTreeSwift
//
//  Created by ZhiYuan on 2019/7/18.
//  Copyright © 2019 郭徽. All rights reserved.
//



import UIKit



class GH_MyViewController: BaseViewController {
    
    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = ""
        // 1.设置导航栏标题属性：设置标题颜色
        // 2.设置导航栏前景色：设置item指示色
//        self.navigationController?.navigationBar.tintColor = UIColor.purple
//
//        // 3.设置导航栏半透明
        self.navigationController?.navigationBar.isTranslucent = true
        
        // 4.设置导航栏背景图片
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        
        // 5.设置导航栏阴影图片
        self.navigationController?.navigationBar.shadowImage = UIImage()
        let button = UIButton()
        
        button.setImage(UIImage.init(named: "Mine_Msg"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(Message), for: UIControl.Event.touchDown)
        
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: button)
    }
   
    override func configUI() {
        view.addSubview(backGroundImageView)
//        backGroundImageView.addSubview(messageButton)
        backGroundImageView.addSubview(nameLable)
        backGroundImageView.addSubview(IDLable)
        backGroundImageView.addSubview(headerImage)
        view.addSubview(wihteView)
        wihteView.addSubview(myLable)
        wihteView.addSubview(changeButton)
        wihteView.addSubview(aboutUsButton)
        view.addSubview(outLogInButton)
        changeButton.titleString = "更改密码"
        changeButton.imageUrl = "Mine_ChangePwd"
        aboutUsButton.titleString = "关于我们"
        aboutUsButton.imageUrl = "Mine_AboutOur"
        layout()
    }
    
    func layout()  {
        backGroundImageView.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(self.view)
            make.height.equalTo(280)
        }
        
//        messageButton.snp.makeConstraints { (make) in
//            make.right.equalTo(backGroundImageView.snp.right).inset(15)
//            make.top.equalTo(backGroundImageView.snp.top).offset(32)
//            make.width.height.equalTo(21)
//        }
        
        nameLable.snp.makeConstraints { (make) in
            make.left.equalTo(backGroundImageView.snp.left).offset(37)
            make.top.equalTo(backGroundImageView.snp.top).offset(97)
            make.width.equalTo(155)
            make.height.equalTo(15)
        }
        
        IDLable.snp.makeConstraints { (make) in
            make.left.equalTo(nameLable)
            make.top.equalTo(nameLable.snp.bottom).offset(10)
            make.width.equalTo(nameLable.snp.width)
            make.height.equalTo(10)
        }
        
        headerImage.snp.makeConstraints { (make) in
            make.right.equalTo(backGroundImageView.snp.right).offset(-92)
            make.top.equalTo(backGroundImageView.snp.top).offset(73)
            make.width.height.equalTo(81)
        }
        
        wihteView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view.snp.centerX)
            make.top.equalTo(self.view.snp.top).offset(180)
            make.width.equalTo(300)
            make.height.equalTo(200)
        }
        
        myLable.snp.makeConstraints { (make) in
            make.left.equalTo(wihteView).offset(25)
            make.top.equalTo(wihteView).offset(23)
            make.width.equalTo(50)
            make.height.equalTo(15)
        }
        changeButton.snp.makeConstraints { (make) in
            make.left.right.equalTo(wihteView)
            make.top.equalTo(myLable.snp.bottom).offset(0)
            make.height.equalTo(55)
        }
        
        aboutUsButton.snp.makeConstraints { (make) in
            make.left.right.equalTo(wihteView)
            make.top.equalTo(changeButton.snp.bottom).offset(0)
            make.height.equalTo(55)
        }
        
        outLogInButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view.snp.centerX)
            make.bottom.equalTo(self.view.snp.bottom).offset(-131)
            make.width.equalTo(300)
            make.height.equalTo(47)
        }
        
        
    }

  private  lazy var backGroundImageView : UIImageView = {
        let imageViews = UIImageView()
        imageViews.image = UIImage.init(named: "Mine_Bg")
        imageViews.isUserInteractionEnabled = true
        return imageViews
    }()
    
 
    
   private  lazy var nameLable : UILabel = {
        let lable = UILabel()
        lable.text = "杰里冬谷的旅行日记"
        lable.font = fonts(R: KWidthscale(R: 15))
        lable.textColor = UIColor.white
        return lable
    }()
    
 private   lazy var IDLable : UILabel = {
        let lable = UILabel()
        lable.text = "ID 12356"
        lable.font = fonts(R: 12)
        lable.textColor = UIColor.white
        return lable
    }()
    
   private lazy var headerImage : UIImageView = {
        let images = UIImageView()
        images.layer.cornerRadius = 40.5
        images.clipsToBounds = true
        images.image = UIImage.init(named: "Mine_Icon")
        images.backgroundColor = UIColor.red;
    images.isUserInteractionEnabled = true
    let getsure = UITapGestureRecognizer.init(target: self, action: #selector(persionMessAge))
    images.addGestureRecognizer(getsure)
    return images
    }()
    
    
 private   lazy var wihteView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 14
        view.layer.shadowColor = UIColor.init(red: 179/255.0, green: 170/255.0, blue: 166/255.0, alpha: 0.26).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowOpacity = 1;
        view.layer.shadowRadius = 16;
        view.layer.cornerRadius = 14;
        return view
    }()
    
  private  lazy var myLable : UILabel = {
        let lable = UILabel()
        lable.text = "我的"
        lable.font = fonts(R: 16)
        lable.textColor = color(R: 51, G: 51, B: 51)
        return lable
    }()
    
  private  lazy var changeButton : GH_My_Button = {
        let button = GH_My_Button()
        button.addTarget(self, action: #selector(changePassword), for: UIControl.Event.touchDown)
        return button
    }()
    
 private   lazy var aboutUsButton : GH_My_Button = {
        let button = GH_My_Button()
        button.addTarget(self, action: #selector(aboutUs), for: UIControl.Event.touchDown)
        return button
    }()
    
    
  private  lazy var outLogInButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = color(R: 255, G: 243, B: 239)
        button.setTitle("退出登录", for: UIControl.State.normal)
        button.titleLabel?.font = fonts(R: 18)
        button.setTitleColor(color(R: 228, G: 57, B: 60), for: UIControl.State.normal)
        button.layer.cornerRadius = 7
        button.addTarget(self, action: #selector(outLogIn), for: UIControl.Event.touchDown)
        return button
    }()
    
    @objc func changePassword()  {
        let vc = GH_ChangePasswordViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @objc func aboutUs()  {
        let vc = GH_AboutUsViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func outLogIn(){
        let  vc = LoginCountAndPassWordViewController()
        let navVC = GH_NavViewController.init(rootViewController: vc)
        UIApplication.shared.keyWindow?.rootViewController = navVC
        
        
    }
    
    @objc func Message(){
        let  vc = GH_MessageViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func persionMessAge(){
        let vc = GH_PersionMessageViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
