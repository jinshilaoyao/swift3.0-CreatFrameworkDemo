//
//  CTMediator.swift
//  CTMediator
//
//  Created by yesway on 2017/5/31.
//  Copyright © 2017年 yesway. All rights reserved.
//

import UIKit

/*
 scheme://[target]/[action]?[params]
 
 url sample:
 aaa://targetA/actionB?id=1234
 */


class CTMediator: NSObject {

    static let instance: CTMediator = CTMediator()
    
    class func shareManager() -> CTMediator {
        return instance
    }
    
    private var cachedTarget: Dictionary<String, AnyClass> = [:]

    // 远程App调用入口
    func performAction(withUrl url: URL, callBack completion: ((Dictionary<String, Any>)?) -> ()) -> Any?{
        
        var params = Dictionary<String, Any>()
        let urlString = url.query
        
        for param in (urlString?.components(separatedBy: "&"))! {
            let elts = param.components(separatedBy: "=")
            if elts.count < 2 { continue }
            params.updateValue(elts.last!, forKey: elts.first!)
        }
        
        // 这里这么写主要是出于安全考虑，防止黑客通过远程方式调用本地模块。这里的做法足以应对绝大多数场景，如果要求更加严苛，也可以做更加复杂的安全逻辑。
        let actionName = url.path.replacingOccurrences(of: "/", with: "")
        if actionName.hasPrefix("native") {
            return false
        }


        // 这个demo针对URL的路由处理非常简单，就只是取对应的target名字和method名字，但这已经足以应对绝大部份需求。如果需要拓展，可以在这个方法调用之前加入完整的路由逻辑
        let result = performTarget(targetName: url.host!, actionName: actionName, andParams: params, shouldCacheTarget: false)
        
        if (result != nil) {
            completion(["result": result!])
        } else {
            completion(nil)
        }
        return result
    }
    // 本地组件调用入口
    
    func performTarget(targetName name: String, actionName action: String, andParams params: Dictionary<String, Any>, shouldCacheTarget flag: Bool) -> Any?{
        
        let targetClassString = "CTMediator.Target_" + name
        let actionString = "Action_" + action
        let TargetClass: AnyClass
        
        var target = cachedTarget[targetClassString]
        
        if target == nil {
            TargetClass = NSClassFromString(targetClassString)!
            target = TargetClass
        }
        
        
        let seletor = NSSelectorFromString(actionString)
        if target == nil {
            // 这里是处理无响应请求的地方之一，这个demo做得比较简单，如果没有可以响应的target，就直接return了。实际开发过程中是可以事先给一个固定的target专门用于在这个时候顶上，然后处理这种请求的
            return nil
        }
        
        guard let targetTemp = target else {
            return nil
        }
        

        if flag {
            cachedTarget.updateValue(targetTemp, forKey: "targetClassString")
        }

        if targetTemp.instancesRespond(to: seletor) {
            let control = UIControl()
            control.sendAction(seletor, to: targetTemp, for: nil)
        }
        

        return 1
    }
    
    func releaseCachedTarget(targetName name: String) {
        
    }

}
