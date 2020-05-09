//
//  RegisterViewController.swift
//  JstTreeSwift
//
//  Created by ZhiYuan on 2019/7/22.
//  Copyright © 2019 郭徽. All rights reserved.
//

import UIKit

class RegisterViewController: BaseViewController, UITextFieldDelegate {

    var phoneString : String?
    var codeString : String?
    var passWordString : String?
    var surePassWordString : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let img = UIImage.init(named: "")
        self.navigationController?.navigationBar.setBackgroundImage(img, for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationItem.title = "注册"
        let rightButton = UIButton()
        rightButton.setTitle("登录", for: UIControl.State.normal)
        rightButton.setTitleColor(color(R: 102, G: 102, B: 102), for: UIControl.State.normal)
        rightButton.titleLabel?.font = fonts(R: 15)
        rightButton.addTarget(self, action: #selector(login), for: UIControl.Event.touchDown)
        let rightBarButton = UIBarButtonItem.init(customView: rightButton)
        self.navigationItem.rightBarButtonItem = rightBarButton        
    }
    
    
    override func configUI() {
        view.addSubview(countLable)
        view.addSubview(countTextField)
        view.addSubview(codeLable)
        view.addSubview(codeTextField)
        view.addSubview(getCode)
        view.addSubview(passWord)
        view.addSubview(passWordTextField)
        view.addSubview(surePassWordLable)
        view.addSubview(surePassWordTextField)
        view.addSubview(lineView1)
        view.addSubview(lineView2)
        view.addSubview(lineView3)
        view.addSubview(lineView4)
        view.addSubview(agreeButton)
        view.addSubview(agreeLable)
        view.addSubview(xieYieButton)
        view.addSubview(registerButton)
        layout()
    }
    
    func layout()  {
        countLable.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(44)
            make.top.equalTo(self.view).offset(140)
        }
        
        countTextField.snp.makeConstraints { (make) in
            make.left.equalTo(countLable.snp.right).offset(37)
            make.top.equalTo(self.view).offset(115)
            make.height.equalTo(58)
        }
        
        lineView1.snp.makeConstraints { (make) in
            make.left.equalTo(countLable)
            make.top.equalTo(countTextField.snp.bottom).offset(0.5)
            make.width.equalTo(288)
            make.height.equalTo(0.5)
        }
        
        codeLable.snp.makeConstraints { (make) in
            make.left.equalTo(countLable)
            make.top.equalTo(lineView1.snp.bottom).offset(25)
        }
        
        codeTextField.snp.makeConstraints { (make) in
            make.left.equalTo(countTextField)
            make.top.equalTo(lineView1.snp.bottom)
            make.height.equalTo(58)
        }
        
        getCode.snp.makeConstraints { (make) in
            make.right.equalTo(self.view).offset(-44)
            make.top.equalTo(lineView1.snp.bottom)
            make.height.equalTo(58)
        }
        
        lineView2.snp.makeConstraints { (make) in
            make.left.equalTo(lineView1)
            make.top.equalTo(codeTextField.snp.bottom).offset(0.5)
          make.width.height.equalTo(lineView1)
        }
        
        passWord.snp.makeConstraints { (make) in
            make.left.equalTo(countLable)
            make.top.equalTo(lineView2.snp.bottom).offset(25)
        }
        
        passWordTextField.snp.makeConstraints { (make) in
            make.left.height.equalTo(countTextField)
            make.top.equalTo(lineView2.snp.bottom)
        }
        
        lineView3.snp.makeConstraints { (make) in
            make.left.height.width.equalTo(lineView1)
            make.top.equalTo(passWordTextField.snp.bottom)
        }
        
        surePassWordLable.snp.makeConstraints { (make) in
            make.left.equalTo(countLable)
            make.top.equalTo(lineView3.snp.bottom).offset(25)
        }
        
        surePassWordTextField.snp.makeConstraints { (make) in
            make.left.height.equalTo(countTextField)
            make.top.equalTo(lineView3.snp.bottom)
        }
        
        lineView4.snp.makeConstraints { (make) in
            make.left.height.width.equalTo(lineView1)
            make.top.equalTo(surePassWordTextField.snp.bottom)
        }
        
        agreeButton.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(46)
            make.top.equalTo(lineView4.snp.bottom).offset(17)
            make.width.height.equalTo(14)
        }
        
        agreeLable.snp.makeConstraints { (make) in
            make.left.equalTo(agreeButton.snp.right).offset(6)
            make.top.equalTo(lineView4.snp.bottom).offset(17)
        }
        xieYieButton.snp.makeConstraints { (make) in
            make.left.equalTo(agreeLable.snp.right)
            make.top.equalTo(agreeLable.snp.top).offset(-5)
        }
        
        registerButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view.snp.centerX)
            make.top.equalTo(agreeLable.snp.bottom).offset(47)
            make.width.equalTo(288)
            make.height.equalTo(47)
        }
    }
    
    
    
    @objc func login(){
        let loginVC = LoginCodeViewController()
        let navVC = GH_NavViewController.init(rootViewController: loginVC)
        self.present(navVC, animated: true, completion: nil)
    }
    
    @objc func getCodeString(){
        
    }
    @objc func XiYi(){
        
    }
    @objc func registerCLick(){
        
        registerFirstResponser()
        if self.phoneString == nil{
//            let hud = MbP
            MBprogressHud(text: "请输入手机号")
            print("请输入手机号")
        }else if self.codeString == nil{
            MBprogressHud(text: "请输入验证码")
            print("请输入验证码")
        }else if self.passWordString == nil{
            MBprogressHud(text: "请输入密码")
            print("请输入密码")
        }else if self.surePassWordString == nil{
            MBprogressHud(text: "请输入确认密码")
            print("请确认密码")
        }else if self.passWordString != self.surePassWordString{
            MBprogressHud(text: "请重新确认密码")
            print("请重新输入确认密码")
        }else{
            MBprogressHud(text: "恭喜您,注册成功~")
            let tabbAr = GH_TabBarViewController()
            UIApplication.shared.keyWindow?.rootViewController = tabbAr
            
            print("注册成功")
        }
        
        
        print("手机号\(self.phoneString ?? ""), 验证码\(self.codeString ?? ""), 密码: \(self.passWordString ?? ""), 确认密码:\(self.surePassWordString ?? "")")
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == countTextField {
            self.phoneString = textField.text
        }else if textField == codeTextField{
            self.codeString = textField.text
        }else if passWordTextField == textField{
            self.passWordString = textField.text
        }else{
            self.surePassWordString = textField.text
        }
    }
   
    func registerFirstResponser()  {
        countTextField.resignFirstResponder()
        codeTextField.resignFirstResponder()
        passWordTextField.resignFirstResponder()
        surePassWordTextField.resignFirstResponder()
    }
    
    
    lazy var countLable : UILabel = {
        return returnLable(text: "手机号")
    }()
    lazy var countTextField : UITextField = {
        return returTextField(placeHolder: "请输入手机号")
    }()
    
    lazy var codeLable : UILabel = {
        return returnLable(text: "验证码")
    }()
    
    lazy var codeTextField:UITextField = {
        returTextField(placeHolder: "请输入验证码")
    }()

    lazy var passWord : UILabel = {
        return returnLable(text: "密码")
    }()
    
    lazy var passWordTextField : UITextField = {
        return returTextField(placeHolder: "请输入密码")
    }()
    
    lazy var surePassWordLable : UILabel = {
        return returnLable(text: "确认密码")
    }()
    
    lazy var surePassWordTextField : UITextField = {
        return returTextField(placeHolder: "请确认密码")
    }()
    
    lazy var lineView1 : UIView = {
        return returnLineView()
    }()
    
    lazy var lineView2 : UIView = {
        return returnLineView()
    }()
    
    lazy var lineView3 : UIView = {
        return returnLineView()
    }()
    
    lazy var lineView4 : UIView = {
        return returnLineView()
    }()
    
    lazy var getCode : UIButton = {
        let button = UIButton()
        button.setTitle("获取验证码", for: UIControl.State.normal)
        button.setTitleColor(color(R: 174, G: 174, B: 174), for: UIControl.State.normal)
        button.titleLabel?.font = fonts(R: 15)
        button.addTarget(self, action: #selector(getCodeString), for: UIControl.Event.touchDown)
        return button
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
    
    lazy var registerButton : UIButton = {
        let button = UIButton()
        let layer = CAGradientLayer()
        layer.colors = [color(R: 254, G: 142, B: 51).cgColor, color(R: 251, G: 109, B: 53).cgColor]
        layer.frame = CGRect(x: 0, y: 0, width: 288, height: 47)
        layer.locations = [0.0, 0.7, 1.0];
        layer.startPoint = CGPoint(x: 0.0, y: 0.0);
        layer.endPoint = CGPoint(x: 1.0, y: 0.0);
        button.layer.addSublayer(layer)
        button.setTitle("立即注册", for: UIControl.State.normal)
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button.titleLabel?.font = fonts(R: 18)
        button.layer.cornerRadius = 7
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(registerCLick), for: UIControl.Event.touchDown)
        
        return button
    }()
    
    
private   func returnLable(text : String) -> UILabel {
        let lable = UILabel()
        lable.text = text
        lable.font = fonts(R: 15)
        lable.textColor = color(R: 51, G: 51, B: 51)
        return lable
    }
 private   func returTextField(placeHolder:String) ->  UITextField {
        let textField = UITextField()
        textField.placeholder = placeHolder
    textField.delegate = self
        textField.setValue(fonts(R: 15), forKeyPath: "_placeholderLabel.font")
        textField.setValue(color(R: 174, G: 174, B: 174), forKeyPath: "_placeholderLabel.textColor")
        return textField
    }
    
 private   func returnLineView() -> UIView {
        let view = UIView()
        view.backgroundColor = color(R: 174, G: 174, B: 174)
        return view
    }
    
}
