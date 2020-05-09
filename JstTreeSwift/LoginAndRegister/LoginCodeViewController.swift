//
//  LoginCodeViewController.swift
//  JstTreeSwift
//
//  Created by ZhiYuan on 2019/7/20.
//  Copyright © 2019 郭徽. All rights reserved.
//

import UIKit

class LoginCodeViewController: BaseViewController, UITextFieldDelegate {

    var countString : String?
    var codeString : String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        UIImage *img = [UIImage imageNamed:@""];
//        [self.navigationController.navigationBar setBackgroundImage:img  forBarMetrics:UIBarMetricsDefault];
//        self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
        let img = UIImage.init(named: "")
        self.navigationController?.navigationBar.setBackgroundImage(img, for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationItem.title = "登录"
        
        let registerButton = UIButton()
        registerButton.frame = CGRect(x: 0, y: 0, width: 29, height: 14)
        registerButton.setTitle("注册", for: UIControl.State.normal)
        registerButton.setTitleColor(color(R: 102, G: 102, B: 102), for: UIControl.State.normal)
        registerButton.titleLabel?.font = fonts(R: 15)
        registerButton.addTarget(self, action: #selector(register), for: UIControl.Event.touchDown)
        let navBarItemRightButton = UIBarButtonItem.init(customView: registerButton)
        self.navigationItem.rightBarButtonItem = navBarItemRightButton
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(Tap))
        self.view.addGestureRecognizer(tap)
        
        Network.request(.login(phone: "17537727881", password: "123456", type: 3), successCallback: { (json) in
            print(json)
        }) { (json) in
            print(123)
        }
        
    }
    override func configUI() {
       view.addSubview(logoImage)
        view.addSubview(countLable)
        view.addSubview(countTextField)
        view.addSubview(lineView)
        view.addSubview(codeLable)
        view.addSubview(codeTextField)
        view.addSubview(getCodeButton)
        view.addSubview(lineiView1)
        view.addSubview(agreeButton)
        view.addSubview(agreeLable)
        view.addSubview(xieYieButton)
        view.addSubview(countAndPasswordButton)
        view.addSubview(loginButton)
        view.addSubview(jiSuLoginLable)
        view.addSubview(xuXianLineLable)
        view.addSubview(xuXianLineLable1)
        view.addSubview(weiXinLoginButton)
        view.addSubview(QQLoginButton)
        layout()
    }
    
    
    
    
    func layout()  {
        logoImage.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.view).offset(84)
            make.width.height.equalTo(55)
        }
        
        countLable.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(44)
            make.top.equalTo(KNavHeight + 116)
            make.width.equalTo(44)
            make.height.equalTo(14)
        }
//
        countTextField.snp.makeConstraints { (make) in
            make.left.equalTo(countLable.snp.right).offset(36)
            make.top.equalTo(countLable.snp.top).offset(-5)
            make.width.equalTo(200)
            make.height.equalTo(20)
        }

        lineView.snp.makeConstraints { (make) in
            make.left.equalTo(countLable)
            make.top.equalTo(countLable.snp.bottom).offset(19)
            make.width.equalTo(288)
            make.height.equalTo(0.5)
        }

        codeLable.snp.makeConstraints { (make) in
            make.left.equalTo(countLable)
            make.top.equalTo(lineView.snp.bottom).offset(25)
            make.width.equalTo(54)
            make.height.equalTo(countLable)
        }

        codeTextField.snp.makeConstraints { (make) in
            make.left.equalTo(countTextField)
            make.top.equalTo(codeLable.snp.top).offset(-5)
//            make.width.equalTo(89)
            make.height.equalTo(20)
        }

        getCodeButton.snp.makeConstraints { (make) in
            make.right.equalTo(self.view.snp.right).offset(-43)
            make.top.equalTo(codeLable.snp.top).offset(-2)
//            make.width.equalTo(74)
            make.height.equalTo(14)
        }

        lineiView1.snp.makeConstraints { (make) in
            make.left.width.height.equalTo(lineView)
            make.top.equalTo(codeLable.snp.bottom).offset(19)
        }

        agreeButton.snp.makeConstraints { (make) in
            make.left.equalTo(codeLable)
            make.top.equalTo(lineiView1.snp.bottom).offset(17)
            make.width.height.equalTo(14)
        }


        agreeLable.snp.makeConstraints { (make) in
            make.left.equalTo(agreeButton.snp.right).offset(6)
            make.top.equalTo(lineiView1.snp.bottom).offset(17)

        }
        xieYieButton.snp.makeConstraints { (make) in
            make.left.equalTo(agreeLable.snp.right)
            make.top.equalTo(agreeLable).offset(-5)
        }

        countAndPasswordButton.snp.makeConstraints { (make) in
            make.right.equalTo(self.view.snp.right).offset(-44)
            make.top.equalTo(agreeLable.snp.top).offset(-5)
        }

        loginButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view.snp.centerX)
            make.top.equalTo(agreeLable.snp.bottom).offset(48)
            make.width.equalTo(288)
            make.height.equalTo(47)
        }
        jiSuLoginLable.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(loginButton.snp.bottom).offset(70)
            make.height.equalTo(14)
        }
        
        xuXianLineLable.snp.makeConstraints { (make) in
            make.right.equalTo(jiSuLoginLable.snp.left).offset( -12)
            make.top.equalTo(loginButton.snp.bottom).offset(77)
            make.height.equalTo(2)
        }
        
        xuXianLineLable1.snp.makeConstraints { (make) in
            make.left.equalTo(jiSuLoginLable.snp.right).offset( 12)
            make.top.equalTo(loginButton.snp.bottom).offset(77)
            make.height.equalTo(2)
        }
        
        weiXinLoginButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view.snp.centerX).offset(-35)
            make.top.equalTo(jiSuLoginLable.snp.bottom).offset(41)
            make.width.height.equalTo(39)
        }
        
        QQLoginButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view.snp.centerX).offset(35)
            make.top.equalTo(jiSuLoginLable.snp.bottom).offset(41)
            make.width.height.equalTo(39)
        }
        
    }
    
    //注册
    @objc func register(){
        let registerVC = RegisterViewController()
//        self.navigationController?.pushViewController(registerVC, animated: true)
        let navVc = GH_NavViewController.init(rootViewController: registerVC)
        
        self.present(navVc, animated: true, completion: nil)
        
    }

    @objc func Tap(){
        registerss()
    }
    
    func registerss()  {
        countTextField.resignFirstResponder()
        codeTextField.resignFirstResponder()
    }
    @objc func XiYi(){
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == countTextField{
            self.countString = textField.text
        }else{
            self.codeString = textField.text
        }
    }
    
    @objc func getCode(){
         registerss()
    }
    
    @objc func countAndPasswordClick(){
        let vc = LoginCountAndPassWordViewController()
        let  nav = GH_NavViewController.init(rootViewController: vc)
//        self.navigationController?.pushViewController(vc, animated: true)
        self.present(nav, animated: true, completion: nil)
        
        
    }
    
    @objc func Login()  {
        registerss()
        
        if self.countString == nil{
            MBprogressHud(text: "请输入账号")
            print("请输入账号")
        }else if self.codeString == nil{
            MBprogressHud(text: "请输入验证码")
            print("请输入验证码")
        }else{
           MBprogressHud(text: "恭喜您, 登录成功!")
            let tabbar = GH_TabBarViewController()
            UIApplication.shared.keyWindow?.rootViewController = tabbar
            
        }
        
    }
    
    @objc func weiXinLogin(){
        let req = SendAuthReq()
        //应用授权作用域，如获取用户个人信息则填写snsapi_userinfo
        req.scope = "snsapi_userinfo"
        WXApi.send(req)
        print("微信登录")
    }
    
    @objc func QQLogin(){
        print("QQ登录")
    }
    
    //懒加载
 private   lazy var logoImage : UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage.init(named: "LOGO")
        return logo
    }()
    
    lazy var countLable : UILabel = {
        let lable = UILabel()
        lable.text = "账号"
        lable.font = fonts(R: 15)
        lable.textColor = color(R: 51, G: 51, B: 51)
        return lable
    }()
    
    lazy var countTextField : UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "请输入账号"
//        textfield.setValue(fonts(R: 15), forKeyPath: "_placeholderLable.font")
//        textfield.setValue(color(R: 174, G: 174, B: 174), forKeyPath: "_placeholderLable.textColor")
        textfield.delegate = self
        return textfield
    }()
    
    lazy var lineView : UIView = {
        let view = UIView()
        view.backgroundColor = color(R: 174, G: 174, B: 174)
        return view
    }()
    
    lazy var codeLable : UILabel = {
        let lable = UILabel()
        lable.text = "验证码"
        lable.font = fonts(R: 15)
        lable.textColor = color(R: 51, G: 51, B: 51)
        return lable
    }()
    
    
    lazy var codeTextField : UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "请输入验证码"
//        textfield.setValue(fonts(R: 15), forKeyPath: "_placeholderLable.font")
//        textfield.setValue(color(R: 174, G: 174, B: 174), forKeyPath: "_placeholderLable.textColor")
        textfield.delegate = self
        return textfield
    }()
    
    lazy var getCodeButton : UIButton = {
        let button = UIButton()
        button.setTitle("获取验证码", for: UIControl.State.normal)
        button.setTitleColor(color(R: 174, G: 174, B: 174), for: UIControl.State.normal)
        button.titleLabel?.font = fonts(R: 15)
        button.addTarget(self, action: #selector(getCode), for: UIControl.Event.touchDown)
        return button
    }()
    
    lazy var lineiView1 : UIView = {
        let  view = UIView()
        view.backgroundColor = color(R: 174, G: 174, B: 174)
        return view
    }()
    
    lazy var agreeButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage.init(named: "Login_nor"), for: UIControl.State.normal)
        return button
    }()
    
    lazy var agreeLable : UILabel = {
        let lable = UILabel()
        lable.text = "我已阅读并同意"
        lable.font = fonts(R: 13)
        lable.textColor = color(R: 121, G: 121, B: 121)
        return lable
    }()
    
    lazy var xieYieButton : UIButton = {
        let button = UIButton()
        button.setTitle("《用户协议》", for: UIControl.State.normal)
        button.setTitleColor(color(R: 239, G: 99, B: 74), for: UIControl.State.normal)
        button.titleLabel?.font = fonts(R: 13)
        button.addTarget(self, action: #selector(XiYi), for: UIControl.Event.touchDown)
        return button
    }()
    
    lazy var countAndPasswordButton : UIButton = {
        let button = UIButton()
        button.setTitle("账号密码登录", for: UIControl.State.normal)
        button.setTitleColor(color(R: 69, G: 135, B: 246), for: UIControl.State.normal)
        button.titleLabel?.font = fonts(R: 13)
        button.addTarget(self, action: #selector(countAndPasswordClick), for: UIControl.Event.touchDown)
        return button
    }()
    
    lazy var loginButton : UIButton = {
        let button = UIButton()
        let layer = CAGradientLayer()
        layer.colors = [color(R: 254, G: 142, B: 51).cgColor, color(R: 251, G: 109, B: 53).cgColor]
        layer.frame = CGRect(x: 0, y: 0, width: 288, height: 47)
        layer.locations = [0.0, 0.7, 1.0];
        layer.startPoint = CGPoint(x: 0.0, y: 0.0);
        layer.endPoint = CGPoint(x: 1.0, y: 0.0);
        button.layer.addSublayer(layer)
        button.setTitle("登录", for: UIControl.State.normal)
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button.titleLabel?.font = fonts(R: 18)
        button.layer.cornerRadius = 7
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(Login), for: UIControl.Event.touchDown)
        
        return button
    }()
    
    lazy var jiSuLoginLable : UILabel = {
        let lable = UILabel()
        lable.text = "极速登录"
        lable.font = fonts(R: 15)
        lable.textColor = color(R: 102, G: 102, B: 102)
        return lable
    }()
    
    
    
    lazy var xuXianLineLable : UILabel  = {
        let lable = UILabel()
        lable.text = "---------------"
        lable.textColor = color(R: 175, G: 175, B: 174)
        return lable
    }()
    
    lazy var xuXianLineLable1 : UILabel  = {
        let lable = UILabel()
        lable.text = "---------------"
        lable.textColor = color(R: 175, G: 175, B: 174)
        return lable
    }()
    
    lazy var weiXinLoginButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage.init(named: "Login_WeChat"), for: UIControl.State.normal)
        button.layer.cornerRadius = 19.5
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(weiXinLogin), for: UIControl.Event.touchDown)
        return button
    }()
    
    lazy var QQLoginButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage.init(named: "Login_QQ"), for: UIControl.State.normal)
        button.layer.cornerRadius = 19.5
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(QQLogin), for: UIControl.Event.touchDown)
        return button
    }()
    
    
}
