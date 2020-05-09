//
//  ForgetPasswordViewController.swift
//  JstTreeSwift
//
//  Created by ZhiYuan on 2019/7/24.
//  Copyright © 2019 郭徽. All rights reserved.
//

import UIKit

class ForgetPasswordViewController: BaseViewController, UITextFieldDelegate {

    var countString : String?
    var codeString : String?
    var newPassWordeString : String?
    var sureNewPassWordString : String?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "忘记密码"
    }
    
    override func configUI() {
        view.addSubview(lineView)
        view.addSubview(countLable)
        view.addSubview(countTextField)
        view.addSubview(lineView1)
        view.addSubview(codeLable)
        view.addSubview(codeTextField)
        view.addSubview(lineView2)
        view.addSubview(newpassWordLable)
        view.addSubview(newPassWordTextfield)
        view.addSubview(lineView3)
        view.addSubview(surePassWordLabel)
        view.addSubview(surePassWordTextField)
        view.addSubview(lineView4)
        view.addSubview(loginButton)
        view.addSubview(getCodeButton)
        Layout()
    }
    
    override func Layout() {
        lineView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.view).offset(64)
            make.width.equalTo(self.view)
            make.height.equalTo(10)
        }
        
        countLable.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(44)
            make.top.equalTo(lineView.snp.bottom).offset(94)
            make.height.equalTo(14)
        }
        
        countTextField.snp.makeConstraints { (make) in
            make.left.equalTo(countLable.snp.right).offset(36)
            make.top.equalTo(lineView.snp.bottom).offset(72)
            make.height.equalTo(58)
        }
        lineView1.snp.makeConstraints { (make) in
            make.left.equalTo(countLable)
            make.top.equalTo(countLable.snp.bottom).offset(19)
            make.right.equalTo(self.view).inset(44)
            make.height.equalTo(0.5)
        }
        
       
        
        codeLable.snp.makeConstraints { (make) in
            make.left.width.height.equalTo(countLable)
            make.top.equalTo(lineView1.snp.bottom).offset(25)
        }
        
        getCodeButton.snp.makeConstraints { (make) in
            make.right.equalTo(self.view.snp.right).offset(-44)
            make.top.equalTo(lineView1.snp.bottom).offset(4)
            make.left.equalTo(codeLable.snp.right).offset(160)
            make.height.equalTo(57)
        }
        
        codeTextField.snp.makeConstraints { (make) in
            make.left.height.equalTo(countTextField)
            make.top.equalTo(lineView1.snp.bottom).offset(5)
            make.right.equalTo(getCodeButton.snp.left).inset(10)
        }
       
        
        lineView2.snp.makeConstraints { (make) in
            make.left.height.width.equalTo(lineView1)
            make.top.equalTo(codeLable.snp.bottom).offset(25)
        }
        
        newpassWordLable.snp.makeConstraints { (make) in
            make.left.height.equalTo(countLable)
            make.top.equalTo(lineView2.snp.bottom).offset(25)
        }
        newPassWordTextfield.snp.makeConstraints { (make) in
            make.left.height.width.equalTo(countTextField)
            make.top.equalTo(lineView2.snp.bottom).offset(5)
        }
        
        lineView3.snp.makeConstraints { (make) in
            make.left.height.width.equalTo(lineView1)
            make.top.equalTo(newpassWordLable.snp.bottom).offset(25)
        }
        
        surePassWordLabel.snp.makeConstraints { (make) in
            make.left.height.equalTo(countLable)
            make.top.equalTo(lineView3.snp.bottom).offset(25)
        }
        surePassWordTextField.snp.makeConstraints { (make) in
            make.left.width.height.equalTo(countTextField)
            make.top.equalTo(lineView3.snp.bottom).offset(5)
        }
        lineView4.snp.makeConstraints { (make) in
            make.left.width.height.equalTo(lineView1)
            make.top.equalTo(surePassWordLabel.snp.bottom).offset(22)
        }
        
        loginButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(lineView4.snp.bottom).offset(62)
            make.width.equalTo(288)
            make.height.equalTo(47)
        }
        
    }

    @objc func getCode(){
        registerTextField()
        if self.countString == nil {
            MBprogressHud(text: "请输入手机号")
        }
    }
    
    @objc func save(){
        registerTextField()
        if self.countString == nil {
            MBprogressHud(text: "请输入手机号")
        }else if self.codeString == nil{
            MBprogressHud(text: "请输入验证码")
        }else if self.newPassWordeString == nil{
            MBprogressHud(text: "请输入新密码")
        }else if self.sureNewPassWordString == nil{
            MBprogressHud(text: "请输入确认密码")
        }else if self.newPassWordeString != self.sureNewPassWordString{
            MBprogressHud(text: "请重新输入确认密码")
        }else{
            print("手机号:\(self.countString ?? ""), 验证码: \(self.codeString ?? ""), 新密码\(self.newPassWordeString ?? ""), 确认密码:\(self.sureNewPassWordString ?? "")")
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == countTextField {
            self.countString = textField.text
        }else if textField == codeTextField {
            self.codeString = textField.text
        }else if textField == newPassWordTextfield{
            self.newPassWordeString = textField.text
        }else{
            self.sureNewPassWordString = textField.text
        }
    }
    
    func registerTextField()  {
        countTextField.resignFirstResponder()
        codeTextField.resignFirstResponder()
        newPassWordTextfield.resignFirstResponder()
        surePassWordTextField.resignFirstResponder()
    }
    
    lazy var grayView: UIView = {
        let view = UIView()
        view.backgroundColor = color(R: 246, G: 246, B: 246)
        return view
    }()
    
    lazy var countLable : UILabel = {
       return LazyLabel(text: "手机号")
    }()
    
    lazy var countTextField : UITextField = {
       return LazyTextField(placeholder: "请输入手机号")
    }()
    
    lazy var lineView : UIView = {
        let view = UIView()
        view.backgroundColor = color(R: 246, G: 246, B: 246)
        return view
    }()
    
    lazy var codeLable : UILabel = {
        return LazyLabel(text: "验证码")
    }()
    
    lazy var codeTextField : UITextField = {
        return LazyTextField(placeholder: "请输入验证码")
    }()
    
    lazy var newpassWordLable : UILabel = {
        return LazyLabel(text: "新密码")
    }()
    
    lazy var newPassWordTextfield : UITextField = {
        return LazyTextField(placeholder: "请输入新密码")
    }()
    
    lazy var surePassWordLabel : UILabel = {
        return LazyLabel(text: "确认密码")
    }()
    
    lazy var getCodeButton : UIButton = {
        let button = UIButton()
        button.setTitle("获取验证码", for: UIControl.State.normal)
        button.setTitleColor(color(R: 174, G: 174, B: 174), for: UIControl.State.normal)
        button.titleLabel?.font = fonts(R: 15)
        button.addTarget(self, action: #selector(getCode), for: UIControl.Event.touchDown)
        return button
    }()
    
    lazy var lineView1 : UIView = {
        return LazyLinewView()
    }()
    
    lazy var lineView2 : UIView = {
        return LazyLinewView()
    }()
    
    lazy var lineView3 : UIView = {
        return LazyLinewView()
    }()
    
    lazy var lineView4 : UIView = {
        return LazyLinewView()
    }()
    
    lazy var surePassWordTextField : UITextField = {
        return LazyTextField(placeholder: "请输入确认密码")
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
        button.setTitle("保存", for: UIControl.State.normal)
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button.titleLabel?.font = fonts(R: 18)
        button.layer.cornerRadius = 7
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(save), for: UIControl.Event.touchDown)
        
        return button
    }()
    
    func LazyLabel(text : String) -> UILabel {
        let lable = UILabel()
        lable.text = text
        lable.font = fonts(R: 15)
        lable.textColor = color(R: 51, G: 51, B: 51)
        return lable
    }
    
    func LazyTextField(placeholder:String) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.setValue(fonts(R: 16), forKeyPath: "_placeholderLabel.font")
        textField.setValue(color(R: 174, G: 174, B: 174), forKeyPath: "_placeholderLabel.textColor")
        textField.delegate = self
        return textField
    }
    
    func LazyLinewView() -> UIView {
        let view = UIView()
        view.backgroundColor = color(R: 174, G: 174, B: 174)
        return view
    }
}
