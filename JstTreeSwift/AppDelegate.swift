//
//  AppDelegate.swift
//  JstTreeSwift
//
//  Created by ZhiYuan on 2019/7/18.
//  Copyright © 2019 郭徽. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, WXApiDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window?.rootViewController = GH_TabBarViewController()
//        let vc = LoginCountAndPassWordViewController()
//        let NavVC = GH_NavViewController.init(rootViewController: vc)
        
//        self.window?.rootViewController = NavVC
        let manager = IQKeyboardManager.shared
        manager.enable = true
        manager.shouldResignOnTouchOutside = true
        WXApi.registerApp("wx59b212926ba6a711")
        
        
        return true
    }
    //  微信跳转回调
    private func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        WXApi.handleOpen(url, delegate: self)
        return true
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
//        let result = UMSocialManager.default().handleOpen(url)
//        if result == false {
            //调用其他SDK，例如支付宝SDK等
            WXApi.handleOpen(url, delegate: self)
//        }
    return true
    }
    
    //  微信回调
    func onResp(_ resp: BaseResp!){
        //  微信登录回调
        if resp.errCode == 0 && resp.type == 0{//授权成功
            let response = resp as! SendAuthResp
            print(response)
            //  微信登录成功通知
//            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "WXLoginSuccessNotification"), object: response.code)
        }
    }
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

