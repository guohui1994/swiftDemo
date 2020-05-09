//
//  GetManager.swift
//  JstTreeSwift
//
//  Created by ZhiYuan on 2019/8/14.
//  Copyright © 2019 郭徽. All rights reserved.
//

import UIKit
import Moya
import Result

enum API{
    case login(phone: String, password: String, type:Int)//登录
}



extension API : TargetType{
    var baseURL: URL {
        return URL(string: "http://139.196.98.15:8082")!
    }
    
    var path: String {
        switch self {
        case .login:
            return "/user/login"
        default:
            return "/"
        }
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .login(let phone, let Password,let type):
            
            
            var paraments :[String : Any] = [:]
            paraments["phone"] = phone
            paraments["password"] = Password
            paraments["type"] = type
            
            return .requestParameters(parameters: paraments, encoding: JSONEncoding.default)
        }
       
    }
    
    var headers: [String : String]? {
        let getManger = GetManager()
        let TimeStempStr = getManger.TimeStap()
        let Version = Bundle.main.infoDictionary!["CFBundleShortVersionString"]
        var Token = UserDefaults.standard.object(forKey: "token")
        let dtvValue = "ios+ \n+\(TimeStempStr)+ \n+\(Version)"
        if Token == nil {
            Token = ""
        }
        
        
        
        //签名
        let signatureStr = NSString.hmacSha1(path, data: dtvValue)
        //拼接base编码
        let signBaseStr : NSString  = "\(Token) + \(signatureStr)" as NSString
        let signBase =  NSString.rb_base64Encoding(signBaseStr as String)
        
        let auth = NSString.pureStr(withOriginStr: signBase)
        return ["Authorization": auth , "authorization-device" : "ios", "Authorization-Version" : Version as! String, "Authorization-Timestamp" : TimeStempStr, "Content-Type" : "application/json"]
    }
    
    
}

private var requestTimeOut:Double = 30

///endpointClosure
private let myEndpointClosure = { (target: API) -> Endpoint in
    ///主要是为了解决URL带有？无法请求正确的链接地址的bug
    let url = target.baseURL.absoluteString + target.path
    var endpoint = Endpoint(
        url: url,
        sampleResponseClosure: { .networkResponse(200, target.sampleData) },
        method: target.method,
        task: target.task,
        httpHeaderFields: target.headers
    )
    switch target {
    case .login:
                    requestTimeOut = 5//按照项目需求针对单个API设置不同的超时时长
        return endpoint
    default:
                    requestTimeOut = 30//设置默认的超时时长
        return endpoint
    }
}

struct Network {
    static let provider = MoyaProvider<API>(endpointClosure: myEndpointClosure)
    
    static func request(_ target: API, successCallback: @escaping ([String:Any]) -> Void,
                        failure failureCallback: @escaping (String) -> Void){
        provider.request(target) { (result) in
            
            switch result{
            case let .success(response):
                if let json = try? response.mapJSON() as! [String:Any]{
                    successCallback(json)
                }
                else{
                    print("服务器连接成功,数据获取失败")
                }
            case let .failure(error):
                failureCallback(error.errorDescription!)
            }
        }
    }
    // MARK: - 取消所有网络请求
    static func cancelAllRequest(){
        provider.manager.session.getAllTasks { (tasks) in
            tasks.forEach{
                print("取消网络请求一次")
                $0.cancel()
            }
        }
    }
}

class GetManager: NSObject {
    
    
    func TimeStap() -> String {
        let date = NSDate.init(timeIntervalSinceReferenceDate: 0)
        let time = date.timeIntervalSince1970
        let times = time * 1000
        let timeString = "\(times)"
        return timeString
    }
    
    
    
    
}
