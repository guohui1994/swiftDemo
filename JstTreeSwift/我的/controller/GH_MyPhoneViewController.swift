//
//  GH_MyPhoneViewController.swift
//  JstTreeSwift
//
//  Created by ZhiYuan on 2019/7/25.
//  Copyright © 2019 郭徽. All rights reserved.
//

import UIKit

class GH_MyPhoneViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "我的手机号"
        self.view.backgroundColor = color(R: 248, G: 248, B: 248)
    }
    
    override func configUI() {
        view.addSubview(whiteView)
        whiteView.addSubview(countLable)
        whiteView.addSubview(countTextField)
        whiteView.addSubview(codeLable)
        whiteView.addSubview(codeTextField)
        whiteView.addSubview(lineView)
        view.addSubview(saveButton)
        Layout()
    }
    override func Layout() {
        whiteView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.top.equalTo(self.view).offset(84)
            make.height.equalTo(91)
        }
        
        lineView.snp.makeConstraints { (make) in
            make.centerY.equalTo(whiteView)
            make.left.equalTo(whiteView).offset(15)
            make.right.equalTo(whiteView).offset(-15)
            make.height.equalTo(0.5)
        }
        
        countLable.snp.makeConstraints { (make) in
            make.left.equalTo(whiteView).offset(15)
            make.bottom.equalTo(lineView.snp.top).offset(-12)
            make.height.equalTo(14)
        }
        
        countTextField.snp.makeConstraints { (make) in
            make.left.equalTo(countLable.snp.right).offset(36)
            make.bottom.equalTo(lineView.snp.bottom).offset(-0.1)
            make.height.equalTo(45)
        }
        
        codeLable.snp.makeConstraints { (make) in
            make.left.width.height.equalTo(countLable)
            make.top.equalTo(lineView.snp.bottom).offset(20)
        }
        codeTextField.snp.makeConstraints { (make) in
            make.left.height.equalTo(countTextField)
            make.top.equalTo(lineView.snp.bottom).offset(0.1)
        }
        saveButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view.centerX)
            make.top.equalTo(whiteView.snp.bottom).offset(55)
            make.width.equalTo(288)
            make.height.equalTo(47)
        }
    }
    
    
    lazy var whiteView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    
    lazy var countLable : UILabel = {
     return   LazyLable(text: "手机号")
    }()
    lazy var countTextField : UITextField = {
        return lazyTextField(placeholder: "请输入手机号")
    }()
    
    lazy var lineView : UIView = {
        let view = UIView()
        view.backgroundColor = color(R: 174, G: 174, B: 174)
        return view
    }()
    
    lazy var codeLable : UILabel = {
        return LazyLable(text: "验证码")
    }()
    
    lazy var codeTextField : UITextField = {
        return lazyTextField(placeholder: "请输入验证码")
    }()
    
    lazy var saveButton : UIButton = {
        let bt = jianBianButton(text: "保存")
        return bt
    }()
    
    func LazyLable(text : String) -> UILabel {
        let lable = UILabel()
        lable.text = text;
        lable.font = fonts(R: 15)
        lable.textColor = color(R: 51, G: 51, B: 51)
        return lable
    }
    
    func lazyTextField(placeholder : String) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.setValue(fonts(R: 15), forKeyPath: "_placeholderLabel.font")
        textField.setValue(color(R: 174, G: 174, B: 174), forKeyPath: "_placeholderLabel.textColor")
        return textField
    }

    
}
