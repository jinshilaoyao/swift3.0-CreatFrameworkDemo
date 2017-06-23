//
//  SearchLogicHomeManager.swift
//  SearchBarExten
//
//  Created by yesway on 2017/5/25.
//  Copyright © 2017年 yesway. All rights reserved.
//

import UIKit

class SearchLogicHomeManager: NSObject, SearchProtocol {

    var searchLogic: String = "default"
    
    var block: ((Dictionary<String, Any>) -> ())? = nil
    
    func startSearch(textFieldContent text: String, callBackBlock block:  @escaping ((Dictionary<String, Any>) -> ())) {
        
        let dict: Dictionary<String, Any> = [ "key": text, "logic": searchLogic ]
        self.block = block
        self.perform(#selector(searchResponse), with: dict, afterDelay: 3)
        
    }
    
    func searchResponse(dict: Dictionary<String, Any>) {
        
        if self.block != nil {
            block!(dict)
        }
        
    }
}
