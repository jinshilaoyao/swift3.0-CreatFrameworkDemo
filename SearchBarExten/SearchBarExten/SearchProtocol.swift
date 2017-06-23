//
//  SearchProtocol.swift
//  SearchBarExten
//
//  Created by yesway on 2017/5/25.
//  Copyright © 2017年 yesway. All rights reserved.
//

import Foundation

protocol SearchProtocol {
    
    var searchLogic: String {set get}
    
    func startSearch(textFieldContent text: String, callBackBlock block:  @escaping ((Dictionary<String, Any>) -> ()))
}
