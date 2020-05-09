//
//  LoginCountAndPassWordViewController.swift
//  JstTreeSwift
//
//  Created by ZhiYuan on 2019/7/22.
//  Copyright © 2019 郭徽. All rights reserved.
//

import UIKit

class LoginCountAndPassWordViewController: BaseViewController, UITextFieldDelegate {

    var countString : String?
    var codeString : String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "登录"
        
        let leftBt = UIButton()
        leftBt.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        leftBt.setTitle("注册", for: UIControl.State.normal)
        leftBt.setTitleColor(color(R: 174, G: 174, B: 174), for: UIControl.State.normal)
        leftBt.titleLabel?.font = fonts(R: 15)
        leftBt.addTarget(self, action: #selector(register), for: UIControl.Event.touchDown)
        let leftBarBt = UIBarButtonItem.init(customView: leftBt)
        self.navigationItem.rightBarButtonItem = leftBarBt
        
       
        
        

    }
    override func configUI() {
        view.addSubview(countLable)
        view.addSubview(countTextfield)
        view.addSubview(lineView1)
        view.addSubview(passWordLabel)
        view.addSubview(passWordTextField)
        view.addSubview(lineView2)
        view.addSubview(forgetBt)
        view.addSubview(loginButton)
        view.addSubview(jiSuLoginLable)
        view.addSubview(xuXianLineLable)
        view.addSubview(xuXianLineLable1)
        view.addSubview(weiXinLoginButton)
        view.addSubview(QQLoginButton)
        view.addSubview(phoneLoginButton)
        
//        view.addSubview(phoneLogin)
        Layout()
    }
    
    override func Layout() {
        countLable.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(44)
            make.top.equalTo(self.view).offset(140)
            make.height.equalTo(15)
        }
        countTextfield.snp.makeConstraints { (make) in
            make.left.equalTo(countLable.snp.right).offset(51)
            make.top.equalTo(self.view).offset(118)
            make.height.equalTo(57)
        }
        
        lineView1.snp.makeConstraints { (make) in
            make.left.equalTo(countLable)
            make.top.equalTo(countLable.snp.bottom).offset(21)
            make.right.equalTo(self.view.snp.right).offset(-44)
            make.height.equalTo(0.5)
        }
        
        passWordLabel.snp.makeConstraints { (make) in
            make.left.width.height.equalTo(countLable)
            make.top.equalTo(lineView1).offset(25)
        }
        
        passWordTextField.snp.makeConstraints { (make) in
            make.left.width.height.equalTo(countTextfield)
            make.top.equalTo(lineView1.snp.bottom).offset(0.5)
        }
        
        lineView2.snp.makeConstraints { (make) in
            make.left.width.height.equalTo(lineView1)
            make.top.equalTo(passWordLabel.snp.bottom).offset(19)
        }
        
        forgetBt.snp.makeConstraints { (make) in
            make.right.equalTo(self.view).offset(-43)
            make.top.equalTo(lineView2.snp.bottom).offset(19)
            make.height.equalTo(20)
        }
        
        loginButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view.snp.centerX)
            make.top.equalTo(forgetBt.snp.bottom).offset(44)
            make.width.equalTo(289)
            make.height.equalTo(48)
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
            make.centerX.equalTo(self.view.snp.centerX)
            make.top.equalTo(jiSuLoginLable.snp.bottom).offset(41)
            make.width.height.equalTo(39)
        }
        
        QQLoginButton.snp.makeConstraints { (make) in
            make.left.equalTo(weiXinLoginButton.snp.right).offset(30)
            make.top.equalTo(jiSuLoginLable.snp.bottom).offset(41)
            make.width.height.equalTo(39)
        }
        
        phoneLoginButton.snp.makeConstraints { (make) in
            make.right.equalTo(weiXinLoginButton.snp.left).offset(-30)
            make.top.equalTo(jiSuLoginLable.snp.bottom).offset(41)
            make.width.height.equalTo(39)
        }
        
       
    }
    
    
    @objc func register(){
        let registerVC = RegisterViewController()
        let nav = GH_NavViewController.init(rootViewController: registerVC)
        self.present(nav, animated: true, completion: nil)
        
    }
    
    @objc func Login(){
        registerTextField()
        if self.countString == nil {
            MBprogressHud(text: "请输入账号")
        }else if self.codeString == nil{
            MBprogressHud(text: "请输入密码")
        }else{
            let Tab = GH_TabBarViewController()
            UIApplication.shared.keyWindow?.rootViewController = Tab
            
        }
    }
    
    @objc func weiXinLogin(){
        
    }
    
    @objc func QQLogin(){
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == countTextfield {
            self.countString = textField.text
        }else{
            self.codeString = textField.text
        }
    }
  
    func registerTextField()  {
        self.countTextfield.resignFirstResponder()
        self.passWordTextField.resignFirstResponder()
    }
    
    @objc func forgetPassword(){
        let forgetVC = ForgetPasswordViewController()
self.navigationController?.pushViewController(forgetVC, animated: true)
    }
    
    @objc func phoneLogin(){
        let vc = LoginCodeViewController()
        let nav = GH_NavViewController.init(rootViewController: vc)
        self.present(nav, animated: true, completion: nil)
        
    }
    
    lazy var countLable : UILabel = {
        let lable = UILabel()
        lable.text = "账号"
        lable.font = fonts(R: 15)
        lable.textColor = color(R: 51, G: 51, B: 51)
        return lable
    }()
    
    lazy var countTextfield : UITextField = {
        let textFild = UITextField()
        textFild.placeholder = "请输入账号"
        textFild.delegate = self
        textFild.setValue(fonts(R: 15), forKeyPath: "_placeholderLabel.font")
        textFild.setValue(color(R: 175, G: 174, B: 174), forKeyPath: "_placeholderLabel.textColor")
        return textFild
    }()
    
    lazy var lineView1 : UIView = {
        let view = UIView()
        view.backgroundColor = color(R: 174, G: 174, B: 174)
        return view
    }()
    
    lazy var lineView2 : UIView = {
        let view = UIView()
        view.backgroundColor = color(R: 174, G: 174, B: 174)
        return view
    }()
    
    lazy var passWordLabel : UILabel = {
        let lable = UILabel()
        lable.text = "密码"
        lable.font = fonts(R: 15)
        lable.textColor = color(R: 51, G: 51, B: 51)
        return lable
    }()
    
    lazy var passWordTextField : UITextField = {
        let textFild = UITextField()
        textFild.placeholder = "请输入密码"
        textFild.delegate = self
        textFild.setValue(fonts(R: 15), forKeyPath: "_placeholderLabel.font")
        textFild.setValue(color(R: 175, G: 174, B: 174), forKeyPath: "_placeholderLabel.textColor")
        return textFild
    }()

    lazy var forgetBt : UIButton = {
        let button = UIButton()
        button.setTitle("忘记密码", for: UIControl.State.normal)
        button.setTitleColor(color(R: 69, G: 135, B: 246), for: UIControl.State.normal)
        button.titleLabel?.font = fonts(R: 15)
        button.addTarget(self, action: #selector(forgetPassword), for: UIControl.Event.touchDown)
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
    
    lazy var phoneLoginButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage.init(named: "Login_Phone"), for: UIControl.State.normal)
        button.layer.cornerRadius = 19.5
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(phoneLogin), for: UIControl.Event.touchDown)
        return button
    }()
    
    
    
}
